import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class GetTradeProfileRx extends RxResponseInt<Map> {
  final api = GetTradeProfile.instance;

  GetTradeProfileRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getTradeProfileData => dataFetcher.stream;

  Future<void> fetchTradeProfileData() async {
    try {
      Map profileData = await api.getTradeProfile();
      return handleSuccessWithReturn(profileData);
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
