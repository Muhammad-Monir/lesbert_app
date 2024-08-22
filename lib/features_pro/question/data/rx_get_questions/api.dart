import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

import '/networks/endpoints.dart';

final class GetQuestionApi {
  static final GetQuestionApi _singleton = GetQuestionApi._internal();
  GetQuestionApi._internal();
  static GetQuestionApi get instance => _singleton;
  Future<Map> getQuestionData() async {
    try {
      Response response = await getHttp(Endpoints.questions());
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
