import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class GetNotificationRX extends RxResponseInt<Map> {
  final api = GetNotificationApi.instance;

  GetNotificationRX({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getTradeProfileData => dataFetcher.stream;

  Future<void> fetchNotificationData() async {
    try {
      Map notification = await api.getNotification();
      return handleSuccessWithReturn(notification);
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
