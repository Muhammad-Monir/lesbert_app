class SignUpResponse {
  bool? success;
  String? message;
  Data? data;
  int? code;

  SignUpResponse({this.success, this.message, this.data, this.code});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  Null? emailVerifiedAt;
  String? token;

  Data({this.user, this.emailVerifiedAt, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    emailVerifiedAt = json['email_verified_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['email_verified_at'] = this.emailVerifiedAt;
    data['token'] = this.token;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms_accepted'] = this.termsAccepted;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
