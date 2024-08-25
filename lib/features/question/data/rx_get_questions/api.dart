import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lsebert/constants/app_constants.dart';
import 'package:lsebert/helpers/di.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

import '/networks/endpoints.dart';

final class GetQuestionApi {
  static final GetQuestionApi _singleton = GetQuestionApi._internal();
  GetQuestionApi._internal();
  static GetQuestionApi get instance => _singleton;
  Future<Map> getQuestionData() async {
    String path = appData.read(kKeyUserType) == "pro"
        ? Endpoints.questionsPro()
        : Endpoints.questionsTrade();

    try {
      Response response = await getHttp(path);
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
