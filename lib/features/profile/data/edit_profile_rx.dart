import 'dart:io';

import 'package:rxdart/rxdart.dart';
import '../../../networks/rx_base.dart';
import 'edit_profile_api.dart';

final class PostEditProProfileRx extends RxResponseInt<Map> {
  final api = PostProEditeProfileApi.instance;

  PostEditProProfileRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get postProProfileEdit => dataFetcher.stream;

  Future<void> postEditProProfile(
      String name, File? image, String profession) async {
    try {
      Map allData = await api.editProProfile(
          name: name, image: image, profession: profession);
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
