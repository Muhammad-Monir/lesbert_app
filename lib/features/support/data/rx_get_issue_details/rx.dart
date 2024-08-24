import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

import 'api.dart';

final class GetIssueDetailsRX extends RxResponseInt {
  final api = GetIssueDetailsApi.instance;

  GetIssueDetailsRX({required super.empty, required super.dataFetcher});

  ValueStream get getProfileData => dataFetcher.stream;

  Future<void> fetchIssueDetailsData(int id) async {
    try {
      Map data = await api.fetchIssueDetailsData(id);
      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
