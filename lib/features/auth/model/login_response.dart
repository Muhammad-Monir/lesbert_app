// ignore_for_file: overridden_fields

import 'dart:convert';

import '../../../helpers/default_response_model.dart';

class LoginResponse extends DefaultResponse {
  bool? success;
  String? message;
  Data? data;
  int? code;

  LoginResponse({this.success, this.message, this.data, this.code});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  Token? token;
  String? role;
  String? isSubscribed;
  String? isBoost;

  Data({this.token, this.role, this.isSubscribed, this.isBoost});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    role = json['role'];
    isSubscribed = json['is_subscribed'];
    isBoost = json['is_boost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['role'] = this.role;
    data['is_subscribed'] = this.isSubscribed;
    data['is_boost'] = this.isBoost;
    return data;
  }
}

class Token {
  Original? original;
  Null? exception;

  Token({this.original, this.exception});

  Token.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? new Original.fromJson(json['original'])
        : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.original != null) {
      data['original'] = this.original!.toJson();
    }
    data['exception'] = this.exception;
    return data;
  }
}

class Original {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Original({this.accessToken, this.tokenType, this.expiresIn});

  Original.fromJson(Map<String, dynamic> json) {
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
