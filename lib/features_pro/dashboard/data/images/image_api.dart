import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostImageApi {
  static final PostImageApi _singleton = PostImageApi._internal();
  PostImageApi._internal();
  static PostImageApi get instance => _singleton;

  Future<Map> postImage(List<File>? images) async {
    try {
      FormData formData = FormData();

      if (images != null && images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          formData.files.add(
            MapEntry(
              "images[]",
              await MultipartFile.fromFile(images[i].path),
            ),
          );
        }
      }

      Response response = await postHttp(Endpoints.proImages(), formData);

      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
