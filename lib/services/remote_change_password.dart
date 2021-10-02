import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/urls/url.dart';

class RemoteChangePassword{
  static var client= http.Client();

  static Future<Map<String, dynamic>> postChangePassword(headers,body) async{
    var response=await client.post(Uri.parse(changePasswordUrl),headers: headers,body: body);

    if(response.statusCode==200){
      var jsonString=response.body;
      return jsonDecode(jsonString);
    }else{
      var jsonString=response.body;
      return jsonDecode(jsonString);
    }
  }
}