import 'package:lsebert/helpers/navigation_service.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import '/helpers/di.dart';

import '/constants/app_constants.dart';
import 'api.dart';

final class GetLogOutRX extends RxResponseInt {
  final api = GetLogOutApi.instance;

  GetLogOutRX({required super.empty, required super.dataFetcher});

  ValueStream get getLogOutData => dataFetcher.stream;

  Future<void> fetchLogoutData() async {
    try {
      Map data = await api.fetchLogoutData();
      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }

  @override
  void handleSuccessWithReturn(data) {
    appData.write(kKeyIsLoggedIn, false);
    appData.erase();

    dataFetcher.sink.add(data);
  }
}
