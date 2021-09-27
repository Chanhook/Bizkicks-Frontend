import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/model/alarm.dart';
import 'package:login/urls/url.dart';

class RemoteAlarm{
  static var client =http.Client();

  static Future<Alarm> fetchAlarm() async{
    var response = await client.get(Uri.parse(alarmUrl));
    if(response.statusCode==200){
      var jsonString = response.body;
      return alarmFromJson(jsonString);
    }else{
      var error = response.body;
      print("getAlarm");
      print(error);
      return null;
    }
  }

  static Future<Map<String, dynamic>> postAlarm(headers,body) async{
    var response = await client.post(Uri.parse(alarmUrl),body: body,headers: headers);
    if(response.statusCode==200){
      var jsonString = response.body;
      print("200: ${jsonString}");
      Map<String, dynamic> user = jsonDecode(jsonString);
      return user;
    }else{
      var jsonString = response.body;
      print("${response.statusCode}: ${jsonString}");
      Map<String, dynamic> error = jsonDecode(jsonString);
      return error;
    }
  }
  //에러코드를 출력하자 정보가 없는 팝업창을 띄우든 재로딩을 하거나 사용자가 알수 있게끔
}