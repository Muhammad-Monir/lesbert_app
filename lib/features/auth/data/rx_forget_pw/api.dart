// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

import '/networks/endpoints.dart';

final class PostForgetPwApi {
  static final PostForgetPwApi _singleton = PostForgetPwApi._internal();
  PostForgetPwApi._internal();
  static PostForgetPwApi get instance => _singleton;
  Future<Map> postForgetPw(
    String email,
    String password,
    String password_confirmation,
    String otp,
  ) async {
    try {
      Map formData = {
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
        'otp': otp
      };
      Response response = await postHttp(Endpoints.resetPassword(), formData);
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
