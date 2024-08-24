import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'experiance_api.dart';

final class GetExperianceRx extends RxResponseInt<Map> {
  final api = GetExperianceApi.instance;

  GetExperianceRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getExperianceData => dataFetcher.stream;

  Future<void> fetchExperianceData() async {
    try {
      Map allData = await api.getExperiance();
      return handleSuccessWithReturn(allData);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) {
    dataFetcher.sink.add(data);
    return data;
  }
}
