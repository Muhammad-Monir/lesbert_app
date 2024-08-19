import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetOccupationQuestionApi {
  static final GetOccupationQuestionApi _singleton = GetOccupationQuestionApi._internal();
  GetOccupationQuestionApi._internal();
  static GetOccupationQuestionApi get instance => _singleton;
  Future<Map> getOccupationQuestionData() async {
    try {
      Response response = await getHttp(Endpoints.occupationQuestions());
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
