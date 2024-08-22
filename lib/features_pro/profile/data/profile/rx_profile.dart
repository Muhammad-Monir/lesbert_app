import 'package:lsebert/features_pro/profile/data/profile/api_profile.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';

final class GetProfileRx extends RxResponseInt<Map> {
  final api = GetProfileApi.instance;

  GetProfileRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get getProProfileData => dataFetcher.stream;

  Future<void> fetchProfileData() async {
    try {
      Map profileData = await api.getProfileData();
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
