import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostPersonalInfoEditApi {
  static final PostPersonalInfoEditApi _singleton =
      PostPersonalInfoEditApi._internal();
  PostPersonalInfoEditApi._internal();
  static PostPersonalInfoEditApi get instance => _singleton;
  Future<Map> personalInfoEdit({
    required String phone,
    required String address,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "phone": phone,
        "address": address,
      });

      Response response = await postHttp(Endpoints.personalInfo(), formData);
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
