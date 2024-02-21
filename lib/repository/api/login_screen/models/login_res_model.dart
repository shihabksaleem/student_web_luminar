// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  Token? token;
  User? user;

  LoginResModel({
    this.token,
    this.user,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user": user?.toJson(),
      };
}

class Token {
  String? refresh;
  String? access;

  Token({
    this.refresh,
    this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}

class User {
  int? id;
  String? fullName;
  String? phone;
  String? dob;
  dynamic email;
  String? gender;
  bool? phoneVerified;
  String? userType;
  bool? isActive;
  int? studentId;
  String? parentNo;

  User({
    this.id,
    this.fullName,
    this.phone,
    this.dob,
    this.email,
    this.gender,
    this.phoneVerified,
    this.userType,
    this.isActive,
    this.studentId,
    this.parentNo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        dob: json["dob"],
        email: json["email"],
        gender: json["gender"],
        phoneVerified: json["phone_verified"],
        userType: json["user_type"],
        isActive: json["is_active"],
        studentId: json["student_id"],
        parentNo: json["parent_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "dob": dob,
        "email": email,
        "gender": gender,
        "phone_verified": phoneVerified,
        "user_type": userType,
        "is_active": isActive,
        "student_id": studentId,
        "parent_no": parentNo,
      };
}
