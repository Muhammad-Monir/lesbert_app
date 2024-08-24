import 'package:rxdart/streams.dart';
import '../../../../networks/rx_base.dart';
import 'security_api.dart';

final class PostSecurityRx extends RxResponseInt<Map> {
  final api = PostSecurityApi.instance;

  PostSecurityRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> changePass(
    String old_password,
    String new_password,
    String new_password_confirmation,
  ) async {
    try {
      Map allData = await api.passChange(
          old_password: old_password,
          new_password: new_password,
          new_password_confirmation: new_password_confirmation);
      handleSuccessWithReturn(allData);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) {
    dataFetcher.sink.add(data);
    return data;
  }
}
