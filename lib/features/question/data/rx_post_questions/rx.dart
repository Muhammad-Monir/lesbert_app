import 'package:lsebert/constants/app_constants.dart';
import 'package:lsebert/helpers/di.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import 'package:lsebert/loading_screen.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class PostQuestionRx extends RxResponseInt<Map> {
  final api = PostQuestionApi.instance;

  PostQuestionRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getQuestionData => dataFetcher.stream;

  Future<Map> postQuestionData(List<Map<int, dynamic>> ansquers) async {
    try {
      Map allAddressData = await api.postQuestionData(ansquers);
      return handleSuccessWithReturn(allAddressData);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) {
    dataFetcher.sink.add(data);
    appData.write(kKeyisanswered, true);
    NavigationService.navigateToReplacement(Routes.loading);
    return data;
  }
}
