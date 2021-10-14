import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/model/check_contract.dart';
import 'package:login/urls/url.dart';

class RemoteCheckContract{
  static var client = http.Client();

  static Future<CheckContract> fetchCheckContract(headers) async {
      var response = await client.get(Uri.parse(contractsUrl),headers: headers);

      if(response.statusCode==200){
        var jsonString=utf8.decode(response.bodyBytes);
        print(jsonString);
        return checkContractFromJson(jsonString);
      }else{
        var jsonString = response.body;
        print("fetchCheckContract error:");
        print(jsonString);
        return null;
      }
  }


  static Future<Map<String, dynamic>> postContract(header,body) async{
    var response = await client.post(Uri.parse(contractsUrl),body: body,headers: header);
    print("postContract: ${response.statusCode}");
    if(response.statusCode==201){
      var jsonString = response.body;
      Map<String, dynamic> result = jsonDecode(jsonString);
      return result;
    }else{
      var jsonString = response.body;
      Map<String, dynamic> error = jsonDecode(jsonString);
      return error;
    }
  }

  static Future<Map<String, dynamic>> putContract(body) async{
    var response = await client.put(Uri.parse(contractsUrl),body: body);
    print(response.statusCode);
    if(response.statusCode==200){
      var jsonString = response.body;
      Map<String, dynamic> result = jsonDecode(jsonString);
      return result;
    }else{
      return null;
    }
  }

  static Future<Map<String, dynamic>> deleteContract(headers,body) async{
    var response = await client.delete(Uri.parse(contractsUrl),headers: headers,body: body);
    print(response.statusCode);
    if(response.statusCode!=204){
      var jsonString = response.body;
      Map<String, dynamic> result = jsonDecode(jsonString);
      return result;
    }else{
      var jsonString = response.body;
      print(jsonString);
    }
  }

}