import 'package:http/http.dart' as http;
import 'package:login/model/measuredrateprice.dart';
import 'package:login/urls/url.dart';

class RemoteService{
  static var client = http.Client();

  static Future<MeasuredRatePrice> fetchPrice() async{
    var response= await client.get(Uri.parse(measuredPriceUrl));
    if(response.statusCode==200){
      var jsonString=response.body;
      return measuredRatePriceFromJson(jsonString);
    }else{
      return null;
    }
  }
}