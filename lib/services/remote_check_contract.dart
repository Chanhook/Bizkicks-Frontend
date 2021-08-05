import 'package:http/http.dart' as http;
import 'package:login/model/check_contract.dart';
import 'package:login/urls/url.dart';

class RemoteCheckContract{
  static var client = http.Client();

  static Future<CheckContract> fetchCheckContract() async {
      var response = await client.get(Uri.parse(checkContractUrl));

      if(response.statusCode==200){
        var jsonString = response.body;
        return checkContractFromJson(jsonString);
      }else{
        return null;
      }
  }

}