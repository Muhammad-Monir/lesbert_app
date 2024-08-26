import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class PostTradeProfileEditApi {
  static final PostTradeProfileEditApi _singleton =
      PostTradeProfileEditApi._internal();
  PostTradeProfileEditApi._internal();
  static PostTradeProfileEditApi get instance => _singleton;
  Future<Map> editTradeProfile({
    required String name,
    File? image,
    required String phone,
    required String address,
    required String about,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "phone": phone,
        "address": address,
        "about": about,
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
          await postHttp(Endpoints.tradeEditProfile(), formData);
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
