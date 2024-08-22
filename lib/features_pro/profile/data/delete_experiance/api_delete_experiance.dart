import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostDeleteExperianceApi {
  static final PostDeleteExperianceApi _singleton =
      PostDeleteExperianceApi._internal();
  PostDeleteExperianceApi._internal();
  static PostDeleteExperianceApi get instance => _singleton;
  Future<Map> deleterExperiance(int id) async {
    try {
      Response response = await deleteHttp(Endpoints.deleteExperiance(id));
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
