// ignore_for_file: overridden_fields, annotate_overrides, unnecessary_question_mark

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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
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
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    role = json['role'];
    isSubscribed = json['is_subscribed'];
    isBoost = json['is_boost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token!.toJson();
    }
    data['role'] = role;
    data['is_subscribed'] = isSubscribed;
    data['is_boost'] = isBoost;
    return data;
  }
}

class Token {
  Original? original;
  Null? exception;

  Token({this.original, this.exception});

  Token.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? Original.fromJson(json['original'])
        : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (original != null) {
      data['original'] = original!.toJson();
    }
    data['exception'] = exception;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
