import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostOtherDetailsEditApi {
  static final PostOtherDetailsEditApi _singleton =
      PostOtherDetailsEditApi._internal();
  PostOtherDetailsEditApi._internal();
  static PostOtherDetailsEditApi get instance => _singleton;
  Future<Map> editOtherDetails({
    required String key_skills,
    required String languages,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "key_skills": key_skills,
        "languages": languages,
      });

      Response response = await postHttp(Endpoints.proOtherSkill(), formData);
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
