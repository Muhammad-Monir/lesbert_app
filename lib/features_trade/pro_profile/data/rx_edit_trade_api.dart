import 'dart:io';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api_edit_trade_profile.dart';

final class PostTradeEditRX extends RxResponseInt<Map> {
  final api = PostTradeProfileEditApi.instance;

  PostTradeEditRX({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postTradeEdit => dataFetcher.stream;

  Future<void> postTradeEditData(
    String name,
    File? image,
    String phone,
    String address,
    String about,
  ) async {
    try {
      Map allData = await api.editTradeProfile(
          name: name,
          image: image,
          phone: phone,
          address: address,
          about: about);
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
