// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  SignUp({
    this.msg,
  });

  String msg;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
