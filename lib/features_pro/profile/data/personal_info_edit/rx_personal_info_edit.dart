import 'package:rxdart/streams.dart';
import '../../../../networks/rx_base.dart';
import 'api_perosonal_info_edit.dart';

final class PostPersonalInfoEditRx extends RxResponseInt<Map> {
  final api = PostPersonalInfoEditApi.instance;

  PostPersonalInfoEditRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> personalInfoEdit(
    String phone,
    String address,
  ) async {
    try {
      Map allData = await api.personalInfoEdit(phone: phone, address: address);
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
