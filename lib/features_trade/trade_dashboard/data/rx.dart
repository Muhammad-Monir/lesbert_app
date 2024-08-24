import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class GetTradeDashboardRX extends RxResponseInt<Map> {
  final api = GetTradeDashboardApi.instance;

  GetTradeDashboardRX({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getTradeDashboard => dataFetcher.stream;

  Future<void> fetchTradeDashboard() async {
    try {
      Map tradeDashboard = await api.getTradeDashboard();
      return handleSuccessWithReturn(tradeDashboard);
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
