import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostExperianceEditApi {
  static final PostExperianceEditApi _singleton =
      PostExperianceEditApi._internal();
  PostExperianceEditApi._internal();
  static PostExperianceEditApi get instance => _singleton;
  Future<Map> editexperiance({
    required String company_name,
    required String designation,
    required String starting_date,
    required String ending_date,
    required String company_location,
    required int id,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "company_name": company_name,
        "designation": designation,
        "starting_date": starting_date,
        "ending_date": ending_date,
        "company_location": company_location,
      });

      Response response =
          await postHttp(Endpoints.proExperinaceEdit(id), formData);
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
