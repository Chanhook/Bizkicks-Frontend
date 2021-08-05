import 'package:http/http.dart' as http;
import 'package:login/model/totalcontract.dart';
import 'package:login/urls/url.dart';

class RemoteTotalContract{
  static var client = http.Client();

  static Future<TotalContract> fetchContractList() async{
    var response= await client.get(Uri.parse(productsUrl));
    if(response.statusCode==200){
      var jsonString=response.body;
      return totalContractFromJson(jsonString);
    }else{
      return null;
    }
  }
  }
