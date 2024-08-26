import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:lsebert/constants/app_constants.dart';
import 'package:lsebert/networks/dio/dio.dart';

import '../../helpers/di.dart';
import '../endpoints.dart';
import '../exception_handler/data_source.dart';

final class Logger extends Interceptor {
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("= = = Dio Request = = =");
    log("${options.headers}");
    log("${options.data}");
    log("${options.contentType}");
    log("${options.extra}");
    log("${options.baseUrl}${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("= = = Dio Success Response = = =");
    log(json.encode(response.data));
    log("${response.requestOptions}");
    log("${response.statusCode}");
    log("${response.statusMessage}");
    log("${response.headers}");
    log("${response.extra}");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      log("= = = Dio Error Response = = =");
      log('Error Response: ${err.response}');
      log('Error Message: ${err.message}');
      log('Error Type: ${err.type}');
      log('Error: ${err.error}');
      log('Error Req option: ${err.requestOptions}');
    }
    if (err.response?.statusCode == 401) {
      if (!isRefreshing) {
        debugPrint("ACCESS TOKEN EXPIRED, GETTING NEW TOKEN PAIR");
        isRefreshing = true;
        await refreshToken(err, handler);
      } else {
        debugPrint("ADDING ERRRORED REQUEST TO FAILED QUEUE");
        failedRequests.add({'err': err, 'handler': handler});
      }
    } else {
      ErrorHandler.handle(err).failure;
    }
    ErrorHandler.handle(err).failure;
    return super.onError(err, handler);
  }

  FutureOr refreshToken(
      DioException err, ErrorInterceptorHandler handler) async {
    // handle refresh token

    var response = await DioSingleton.instance.dio.post(
      Endpoints.refreshUrl(),
    );
    var parsedResponse = response.data;
    if (response.statusCode == 401 || response.statusCode == 403) {
      // handle logout
      debugPrint("LOGGING OUT: EXPIRED REFRESH TOKEN");
      return handler.reject(err);
    }
    RefreshModel refreshModel = RefreshModel.fromJson(parsedResponse);

    // handle setting tokens in your store for future requests
    isRefreshing = false;
    failedRequests.add({'err': err, 'handler': handler});
    debugPrint("RETRYING ${failedRequests.length} FAILED REQUEST(s)");
    await appData.write(kKeyAccessToken, refreshModel.data?.accessToken);
    retryRequests(parsedResponse['access_token']);
  }

  Future retryRequests(token) async {
    for (var i = 0; i < failedRequests.length; i++) {
      debugPrint(
          'RETRYING[$i] => PATH: ${failedRequests[i]['err'].requestOptions.path}');
      RequestOptions requestOptions =
          failedRequests[i]['err'].requestOptions as RequestOptions;
      requestOptions.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      DioSingleton.instance.update(token);
      await DioSingleton.instance.dio.fetch(requestOptions).then(
            failedRequests[i]['handler'].resolve,
            onError: (error) =>
                failedRequests[i]['handler'].reject(error as DioException),
          );
    }
    isRefreshing = false;
    failedRequests = [];
  }
}

class RefreshModel {
  bool? success;
  String? message;
  Data? data;
  int? code;

  RefreshModel({this.success, this.message, this.data, this.code});

  RefreshModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Data({this.accessToken, this.tokenType, this.expiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
