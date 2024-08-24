import 'package:rxdart/streams.dart';
import '../../../../networks/rx_base.dart';
import 'api_experiance_edit.dart';

final class PostExperianceEditRx extends RxResponseInt<Map> {
  final api = PostExperianceEditApi.instance;

  PostExperianceEditRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> postExperiance(
    String company_name,
    String designation,
    String starting_date,
    String ending_date,
    String company_location,
    int id,
  ) async {
    try {
      Map allData = await api.editexperiance(
          company_name: company_name,
          designation: designation,
          starting_date: starting_date,
          ending_date: ending_date,
          company_location: company_location,
          id: id);
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
