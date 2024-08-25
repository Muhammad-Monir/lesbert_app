// ignore_for_file: non_constant_identifier_names

import 'package:rxdart/streams.dart';

import '../../../../networks/rx_base.dart';
import 'api_bio_update.dart';

final class PostBioUpdateRx extends RxResponseInt<Map> {
  final api = PostBioEditApi.instance;

  PostBioUpdateRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> postBioUpdate(
    String bio,
    String current_company,
    String current_designation,
    String location,
    String industry,
  ) async {
    try {
      Map allData = await api.editProBiorDetails(
          bio: bio,
          current_company: current_company,
          current_designation: current_designation,
          location: location,
          industry: industry);
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
