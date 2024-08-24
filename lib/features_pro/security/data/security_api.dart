import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostSecurityApi {
  static final PostSecurityApi _singleton = PostSecurityApi._internal();
  PostSecurityApi._internal();
  static PostSecurityApi get instance => _singleton;
  Future<Map> passChange({
    required String old_password,
    required String new_password,
    required String new_password_confirmation,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "old_password": old_password,
        "new_password": new_password,
        "new_password_confirmation": new_password_confirmation,
      });

      Response response = await postHttp(Endpoints.postChangePass(), formData);
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
