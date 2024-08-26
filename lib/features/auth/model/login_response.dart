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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
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
  String? isVerified;
  String? isAnswered;

  Data(
      {this.token,
      this.role,
      this.isSubscribed,
      this.isBoost,
      this.isVerified,
      this.isAnswered});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    role = json['role'];
    isSubscribed = json['is_subscribed'];
    isBoost = json['is_boost'];
    isVerified = json['is_verified'];
    isAnswered = json['is_answered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['role'] = this.role;
    data['is_subscribed'] = this.isSubscribed;
    data['is_boost'] = this.isBoost;
    data['is_verified'] = this.isVerified;
    data['is_answered'] = this.isAnswered;
    return data;
  }
}

class Token {
  Original? original;
  Null? exception;

  Token({this.original, this.exception});

  Token.fromJson(Map<String, dynamic> json) {
    original =
        json['original'] != null ? Original.fromJson(json['original']) : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
