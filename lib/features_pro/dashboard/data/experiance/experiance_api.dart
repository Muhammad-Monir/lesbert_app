import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetExperianceApi {
  static final GetExperianceApi _singleton = GetExperianceApi._internal();
  GetExperianceApi._internal();
  static GetExperianceApi get instance => _singleton;
  Future<Map> getExperiance() async {
    try {
      Response response = await getHttp(Endpoints.getExperiance());
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
