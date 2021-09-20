import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/model/signUp.dart';
import 'package:login/urls/url.dart';

class RemoteSignUp {
  static var client = http.Client();

  static Future<SignUp> postSignUp(body) async {
    var response = await client.post(Uri.parse(signUpUrl),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print(response.statusCode);
    if (response.statusCode == 201) {
      var jsonString = response.body;
      var result = signUpFromJson(jsonString);
      return result;
    } else {
      var jsonString = response.body;
      Map<String, dynamic> error = jsonDecode(jsonString);
      print(response.body);
      return null;
    }
  }

  static Future<Map<String, dynamic>> postLicense(body) async {
    var response = await client.post(Uri.parse(licenseUrl), body: body,headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var result = jsonDecode(jsonString);
      return result;
    } else {
      var jsonString = response.body;
      var error = jsonDecode(jsonString);
      return error;
    }
  }

//에러코드를 출력하자 정보가 없는 팝업창을 띄우든 재로딩을 하거나 사용자가 알수 있게끔
}
