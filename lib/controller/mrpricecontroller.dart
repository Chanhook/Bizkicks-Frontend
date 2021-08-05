import 'package:get/state_manager.dart';
import 'package:login/services/remote_service.dart';

class MRPriceController extends GetxController{
  var isLoading = true.obs;
  var measuredRatedPrice=10.obs;

  @override
  void onInit(){
    fetchPrice();
    super.onInit();
  }

  void fetchPrice() async{
    try{
      isLoading(true);
      var price = await RemoteService.fetchPrice();
      if(price !=null){
        measuredRatedPrice.value= price.price;
      }
    }finally{
      //isLoading(false);
    }
  }
}