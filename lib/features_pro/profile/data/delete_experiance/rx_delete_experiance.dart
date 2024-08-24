import 'package:rxdart/streams.dart';
import '../../../../networks/rx_base.dart';
import 'api_delete_experiance.dart';

final class PostDeleteExperianceRx extends RxResponseInt<Map> {
  final api = PostDeleteExperianceApi.instance;

  PostDeleteExperianceRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> postDeleterExperiance(int id) async {
    try {
      Map allData = await api.deleterExperiance(id);
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
