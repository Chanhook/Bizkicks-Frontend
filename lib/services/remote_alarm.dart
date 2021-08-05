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
}