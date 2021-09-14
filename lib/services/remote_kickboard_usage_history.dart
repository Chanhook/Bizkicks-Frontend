import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/model/error.dart';
import 'package:login/model/kickboard_usage_history.dart';
import 'package:login/urls/url.dart';

class RemoteKickboardUsageHistory{
  static var client = http.Client();

  static Future<KickboardUsageHistory> getHistory() async{
    var response= await client.get(Uri.parse(kickboardUsageHistoryUrl));

    if(response.statusCode==200){
      var jsonString=response.body;
      return kickboardUsageHistoryFromJson(jsonString);
    }else{
      Map<String,dynamic> result=jsonDecode(response.body);
      print(result["timestamp"]);
      print(result["status"]);
      print(result["error"]);
      print(result["code"]);
      print(result["msg"]);
      return null;
    }

  }


}