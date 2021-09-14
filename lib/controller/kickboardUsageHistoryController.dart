import 'package:get/get.dart';
import 'package:login/model/kickboard_usage_history.dart';
import 'package:login/services/remote_kickboard_usage_history.dart';

class KickboardUsageHistoryController extends GetxController{
  var isLoading=true.obs;

  var unit=0.obs;
  var total_time=0.obs;
  List<History> history=[];


  @override
  void onInit(){
    super.onInit();
    getHistory();
  }

  void getHistory() async{
   try{
     isLoading(false);
     var result=await RemoteKickboardUsageHistory.getHistory();
     if(result!=null){
       unit.value=result.unit;
       total_time.value=result.unit;
       result.history.forEach((h) { history.add(h);});
     }else{
       print("return null");
     }
   }finally{
     isLoading(true);
   }

  }



}