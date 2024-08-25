// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostBioEditApi {
  static final PostBioEditApi _singleton =
      PostBioEditApi._internal();
  PostBioEditApi._internal();
  static PostBioEditApi get instance => _singleton;
  Future<Map> editProBiorDetails({
    required String bio,
    required String current_company,
    required String current_designation,
    required String location,
    required String industry,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "bio": bio,
        "current_company": current_company,
        "current_designation": current_designation,
        "location": location,
        "industry": industry,
      });

      Response response =
          await postHttp(Endpoints.proBioUpdate(), formData);
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
