import 'package:get/get.dart';
import 'package:login/model/kickboard_usage_history.dart';
import 'package:login/services/remote_kickboard_usage_history.dart';

class KickboardUsageHistoryController extends GetxController{
  var isLoading=true.obs;

  var unit=0.obs;
  var total_time=0.obs;
  List<History> history=[];

  var body='{"brand" : "씽씽" ,"depart_time" : "2020-10-10T14:20:15" ,"arrive_time" : "2020-10-10T14:25:40" ,"location_list" :[{"latitude" : 131.0"longitude" : 131.1},"latitude" : 131.2,"longitude" : 131.6}],"cycle" : 5000}';

  @override
  void onInit(){
    super.onInit();
    getHistory();
    postHistory();
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
     print(unit.value);
   }

  }

  void postHistory() async{
    try{
      isLoading(false);
      var result= await RemoteKickboardUsageHistory.postHistory(body);
      if(result!=null){
        print("msg: ${result["msg"]}");
      }
    }finally{
      isLoading(true);
    }
  }



}