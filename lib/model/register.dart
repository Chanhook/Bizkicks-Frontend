// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.id,
    this.password,
    this.phoneNumber,
    this.companyCode,
  });

  String id;
  String password;
  String phoneNumber;
  String companyCode;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    id: json["id"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    companyCode: json["company_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "phone_number": phoneNumber,
    "company_code": companyCode,
  };
}
