// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class AddExperianceApi {
  static final AddExperianceApi _singleton = AddExperianceApi._internal();
  AddExperianceApi._internal();
  static AddExperianceApi get instance => _singleton;
  Future<Map> addNewExperiance({
    required String company_name,
    required String designation,
    required String starting_date,
    required String ending_date,
    required String company_location,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "company_name": company_name,
        "designation": designation,
        "company_location": company_location,
        "starting_date": starting_date,
        "ending_date": ending_date,
      });

      Response response =
          await postHttp(Endpoints.addNewExperiance(), formData);
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
