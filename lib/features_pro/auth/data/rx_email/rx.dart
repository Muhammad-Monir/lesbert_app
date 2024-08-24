import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class PostForgetEmailRX extends RxResponseInt {
  final api = PostForgetEmailApi.instance;

  String message = "Something went wrong".tr;

  PostForgetEmailRX({required super.empty, required super.dataFetcher});

  ValueStream get getPostForgetEmailRes => dataFetcher.stream;

  Future<bool> postForgetEmail({String? email}) async {
    try {
      Map<String, dynamic> data = {"email": email};
      Map resdata = await api.postForgetEmail(data);
      return handleSuccessWithReturn(resdata);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) {
    dataFetcher.sink.add(data);

    message = data["message"];
    if (data["success"] == false) throw Exception();
    return true;
  }
}
