import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class VerifyOtpApi {
  static final VerifyOtpApi _singleton = VerifyOtpApi._internal();
  VerifyOtpApi._internal();
  static VerifyOtpApi get instance => _singleton;
  Future<Map> verifyOtp({
    required String code,
    required String email,
  }) async {
    try {
      Map data = {"otp": code, "email": email};
      Response response = await postHttp(Endpoints.verifyOtpCode(), data);

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
