import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

import '../../model/login_response.dart';
import '/networks/endpoints.dart';

final class LoginApi {
  static final LoginApi _singleton = LoginApi._internal();
  LoginApi._internal();
  static LoginApi get instance => _singleton;
  Future<LoginResponse> login(String email, String password) async {
    try {
      Map data = {"email": email, "password": password};

      Response response = await postHttp(Endpoints.logIn(), data);

      if (response.statusCode == 200) {
        LoginResponse data = LoginResponse.fromJson(response.data);
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
