// ignore_for_file: unnecessary_question_mark

class SignUpResponse {
  bool? success;
  String? message;
  Data? data;
  int? code;

  SignUpResponse({this.success, this.message, this.data, this.code});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  Null? emailVerifiedAt;
  String? token;

  Data({this.user, this.emailVerifiedAt, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    emailVerifiedAt = json['email_verified_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['email_verified_at'] = emailVerifiedAt;
    data['token'] = token;
    return data;
  }
}

class User {
  bool? termsAccepted;
  String? name;
  String? email;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.termsAccepted,
      this.name,
      this.email,
      this.role,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    termsAccepted = json['terms_accepted'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terms_accepted'] = termsAccepted;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
