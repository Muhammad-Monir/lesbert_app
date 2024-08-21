import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class PostProEditeProfileApi {
  static final PostProEditeProfileApi _singleton =
      PostProEditeProfileApi._internal();
  PostProEditeProfileApi._internal();
  static PostProEditeProfileApi get instance => _singleton;
  Future<Map> editProProfile({
    required String name,
    File? image,
    required String profession,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "profession": profession,
      });
      if (image != null) {
        log(image.path);
        formData.files.add(
          MapEntry(
            "avatar",
            await MultipartFile.fromFile(image.path),
          ),
        );
      }

      Response response =
          await postHttp(Endpoints.proProfileUpdate(), formData);
      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
