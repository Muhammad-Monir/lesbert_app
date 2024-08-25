import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';


final class DeleteProfileImageRX extends RxResponseInt {
  final api = DeleteProfileImageApi.instance;

  DeleteProfileImageRX({required super.empty, required super.dataFetcher});

  ValueStream get getPostIssueData => dataFetcher.stream;

  Future<void> deleteProfileImage(
    String id,
  ) async {
    try {
      Map data = {
        "image_id": id,
      };
      Map resdata = await api.deleteProfileImageApi(data);
      handleSuccessWithReturn(resdata);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
