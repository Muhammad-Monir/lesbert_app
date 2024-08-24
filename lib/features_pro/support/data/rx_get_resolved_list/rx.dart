import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

import 'api.dart';

final class GetResolvedListRX extends RxResponseInt {
  final api = GetResolvedListApi.instance;

  GetResolvedListRX({required super.empty, required super.dataFetcher});

  ValueStream get getProfileData => dataFetcher.stream;

  Future<void> fetchResolvedData() async {
    try {
      Map data = await api.fetchResolvedData();
      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
