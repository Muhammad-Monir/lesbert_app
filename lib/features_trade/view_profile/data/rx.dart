import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class GetProProfileDataRX extends RxResponseInt<Map> {
  final api = GetProProfileDataApi.instance;

  GetProProfileDataRX({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getTradeProfileData => dataFetcher.stream;

  Future<void> fetchTradeProfileDetailsData(int id) async {
    try {
      Map profileData = await api.getProProfile(id);
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
