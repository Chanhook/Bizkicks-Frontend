
import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:login/model/alarm.dart';
import 'package:login/services/remote_alarm.dart';

class AlarmController extends GetxController{
  var isLoading=true.obs;
  var alarm=Rx<Alarm>(null);
  var body=jsonEncode('{"list" : [{"type" : "cost","value" : 2500},{"type" : "cost","value" : 2500}]}');
  @override
  void onInit(){
    fetchAlarm();
    super.onInit();
  }
  void fetchAlarm() async{
    try{
      isLoading(true);
      var result=await RemoteAlarm.fetchAlarm();
      if(result!=null){
        alarm.value=result;
        print("get: ${alarm.value.list[0].value}");
      }
    }finally{
      isLoading(false);
    }
  }

}