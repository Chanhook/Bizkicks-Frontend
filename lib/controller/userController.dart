import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:login/urls/url.dart';

class UserController extends GetxController{
  var isLoading = true.obs;

  var id = "".obs;
  var name = "".obs;
  var user_role = "".obs;
  var license = true.obs;
  var phone_number = "".obs;
  var company_name = "".obs;

  var grantType="";
  var accessToken="";
  var accessTokenExpiresIn=0;
  var refreshToken="";
  Map<String,String> headers={};


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUserInfo() async {
    try {
      isLoading(false);
      Map<String,String> _headers={
        "authorization" : "Bearer ${accessToken}"
      };
      headers=_headers;
      var response = await http.get(Uri.parse(userInfoUrl), headers: headers);
      var jsonString=response.body;
      Map<String,dynamic> user=jsonDecode(jsonString);
      id.value=user["id"];
      name.value=user["name"];
      user_role.value=user["user_role"];
      license.value=user["license"] as bool;
      phone_number.value=user["phone_number"];
      company_name.value=user["company_name"];
      print("getUserInfo: ");
      print(user_role.value);
    } finally {
      isLoading(true);
    }
  }
}
