import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

import 'api.dart';

final class GetPendingListRX extends RxResponseInt {
  final api = GetPendingListApi.instance;

  GetPendingListRX({required super.empty, required super.dataFetcher});

  ValueStream get getProfileData => dataFetcher.stream;

  Future<void> fetchPendingListData() async {
    try {
      Map data = await api.fetchPendingListData();
      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
