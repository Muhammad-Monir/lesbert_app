import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetPaymentHistoryRx extends RxResponseInt {
  final api = GetPaymentHistoryApi.instance;

  GetPaymentHistoryRx({required super.empty, required super.dataFetcher});

  ValueStream get getSliderData => dataFetcher.stream;

  Future<void> fetchPaymentHistoryData() async {
    try {
      Map data = await api.fetchPaymentHistory();
      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
