import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetOccupationQuestionRx extends RxResponseInt<Map> {
  final api = GetOccupationQuestionApi.instance;

  GetOccupationQuestionRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getOccupationQuestionData => dataFetcher.stream;

  Future<void> fetchOccupationQuestionData() async {
    try {
      Map allOccupationQuestion = await api.getOccupationQuestionData();
      return handleSuccessWithReturn(allOccupationQuestion);
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
