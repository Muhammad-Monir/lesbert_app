import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/app_constants.dart';

import '../../../../helpers/di.dart';
import '../../../../helpers/navigation_service.dart';

import '../../../../networks/rx_base.dart';

import 'api.dart';

final class GetQuestionRx extends RxResponseInt<Map> {
  final api = GetQuestionApi.instance;

  GetQuestionRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getQuestionData => dataFetcher.stream;

  Future<void> fetchQuestionData() async {
    try {
      Map allAddressData = await api.getQuestionData();
      return handleSuccessWithReturn(allAddressData);
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
