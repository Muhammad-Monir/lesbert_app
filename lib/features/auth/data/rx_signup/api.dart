import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class SignUpApi {
  static final SignUpApi _singleton = SignUpApi._internal();
  SignUpApi._internal();
  static SignUpApi get instance => _singleton;
  Future<Map> signUp({
    required String firstName,
    required String email,
    required String phone,
    required String password,
    required String role,
    required bool termAccepted,
  }) async {
    try {
      Map data = {
        "name": firstName,
        "email": email,
        "password": phone,
        "password_confirmation": password,
        "role": role,
        "terms_accepted": termAccepted
      };
      Response response = await postHttp(Endpoints.signUp(), data);
      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        Map data = json.decode(json.encode(response.data));
        return data;
        // throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
