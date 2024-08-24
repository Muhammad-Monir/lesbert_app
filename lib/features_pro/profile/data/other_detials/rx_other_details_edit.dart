import 'package:rxdart/streams.dart';
import '../../../../networks/rx_base.dart';
import 'api_other_details_edit.dart';

final class PostOtherDetailsRX extends RxResponseInt<Map> {
  final api = PostOtherDetailsEditApi.instance;

  PostOtherDetailsRX({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> postOtherDetails(
    String key_skills,
    String languages,
  ) async {
    try {
      Map allData = await api.editOtherDetails(
          key_skills: key_skills, languages: languages);
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
