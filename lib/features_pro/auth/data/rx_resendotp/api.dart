import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class ResendOtpApi {
  static final ResendOtpApi _singleton = ResendOtpApi._internal();
  ResendOtpApi._internal();
  static ResendOtpApi get instance => _singleton;
  Future<Map> resendOtp({
    required String email,
  }) async {
    try {
      Map data = {"email": email};
      Response response = await postHttp(Endpoints.resendOtp(), data);

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
