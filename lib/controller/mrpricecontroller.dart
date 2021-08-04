import 'package:get/state_manager.dart';
import 'package:login/services/remote_service.dart';

class MRPriceController extends GetxController{
  var isLoading = true.obs;
  var measuredRatedPrice=10;

  @override
  void onInit(){
    fetchPrice();
    super.onInit();
  }

  void fetchPrice() async{
    try{
      isLoading(true);
      var price = await RemoteService.fetchPrice();
      print("리모트로 받아온거${price.price}");
      print("hi");
      if(price !=null){
        measuredRatedPrice= price.price;
        update();
      }
    }finally{
      //isLoading(false);
    }
  }
}