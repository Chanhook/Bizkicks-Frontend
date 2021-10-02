// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.id,
    this.name,
    this.password,
    this.phoneNumber,
    this.companyCode,
    this.license,
    this.userRole,
    this.email,
  });

  String id;
  String name;
  String password;
  String phoneNumber;
  String companyCode;
  bool license;
  String userRole;
  String email;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    id: json["id"],
    name: json["name"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    companyCode: json["company_code"],
    license: json["license"],
    userRole: json["user_role"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "password": password,
    "phone_number": phoneNumber,
    "company_code": companyCode,
    "license": license,
    "user_role": userRole,
    "email":email,
  };
}
