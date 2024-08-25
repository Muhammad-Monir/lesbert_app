import 'dart:io';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'image_api.dart';

final class PostImageRx extends RxResponseInt {
  final api = PostImageApi.instance;

  PostImageRx({required super.empty, required super.dataFetcher});

  ValueStream get postImage => dataFetcher.stream;

  Future<void> postProImage(List<File>? images) async {
    try {
      Map allData = await api.postImage(images);
      handleSuccessWithReturn(allData);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }

  @override
  void handleSuccessWithReturn(data) {

    dataFetcher.sink.add(data);
  }
}
