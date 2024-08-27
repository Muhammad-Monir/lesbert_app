import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetSubscriptionPackagesRx extends RxResponseInt {
  final api = GetSubscriptionPackagesApi.instance;

  GetSubscriptionPackagesRx({required super.empty, required super.dataFetcher});

  ValueStream get getSliderData => dataFetcher.stream;

  Future<void> fetchSubscriptionPackageData() async {
    try {
      Map data = await api.fetchSubscriptionPackages();
      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
