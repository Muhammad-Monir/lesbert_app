// ignore_for_file: non_constant_identifier_names

import 'package:rxdart/streams.dart';
import '../../../../networks/rx_base.dart';
import 'api_add_new_experiance.dart';

final class PsotAddNewExperianceRx extends RxResponseInt<Map> {
  final api = AddExperianceApi.instance;

  PsotAddNewExperianceRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> postAddNewExperiance(
    String company_name,
    String designation,
    String starting_date,
    String ending_date,
    String company_location,
  ) async {
    try {
      Map allData = await api.addNewExperiance(
          company_name: company_name,
          designation: designation,
          starting_date: starting_date,
          ending_date: ending_date,
          company_location: company_location);
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
