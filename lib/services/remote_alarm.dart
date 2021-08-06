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
      return null;
    }
  }

  static Future<Map<String, dynamic>> postAlarm(body) async{
    var response = await client.post(Uri.parse(alarmUrl),body: body);
    print(response.statusCode);
    if(response.statusCode==200){
      var jsonString = response.body;
      Map<String, dynamic> user = jsonDecode(jsonString);
      return user;
    }else{
      return null;
    }
  }
}