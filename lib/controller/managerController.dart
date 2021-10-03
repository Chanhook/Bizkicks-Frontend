import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:login/model/alarm.dart';
import 'package:login/screen/measured_rate_page.dart';
import 'package:login/services/remote_alarm.dart';

import '../screen/contract_screen.dart';
import '../screen/dashboard_screen.dart';
import '../screen/manager_page.dart';
import '../screen/mypage_screen.dart';

class ManagerController extends GetxController {
  var isLoading=true.obs;

  var title = "계약 목록".obs;
  dynamic selectedIndex = 0.obs;

  var startDate = DateTime.now();
  var endDate = DateTime.now();


  @override
  void onInit(){
    super.onInit();
    selectedIndex = 0.obs;
    step = 0.obs;
    timeAlarm.clear();
    priceAlarm.clear();
    getAlarm();
  }

  final RxMap<dynamic, dynamic> ui = {
    0: ContractListBackground(),
    1: Contract(),
    2: DashBoard(),
    3: MyPage(),
    'measuredModel': MeasuredModelContract(),
  }.obs;

  var step = 0.obs;
  final List<dynamic> stepList = [
    Contractfirst(s: "멤버십 모델 설명",),
    ContractSecond(type:"membership",),
    ContractThird(),
    ContractFourth()
  ];
  final List<dynamic> planStep = [
    Contractfirst(s: "플랜 모델 설명"),
    ContractSecond(type:"plan",),
    ContractThird(),
    ContractFourth()
  ];


  //리스트니까 alarms로 바꾸자
  final List<int> timeAlarm = <int>[].obs;
  final List<int> priceAlarm = <int>[].obs;

  void originalState() => step.value = 0;

  void prevStep() => step.value--;

  void nextStep() => step.value++;

  void addTimeAlarm(time) {
    timeAlarm.add(int.parse(time));
    timeAlarm.sort();
  }

  void addPriceAlarm(price) {
    priceAlarm.add(int.parse(price));
    priceAlarm.sort();
  }

  void setDeadline() {
    startDate = DateTime.now();
    endDate = new DateTime(startDate.year,startDate.month+1,startDate.day,startDate.hour,startDate.minute,startDate.second);
  }

  String initBody(){
    Alarm obj=new Alarm();
    List<ListElement> lst=[];
    for(var i=0;i<timeAlarm.length;i++){
      ListElement myListElement=new ListElement(type: "time",value: timeAlarm[i]);
      lst.add(myListElement);
    }
    for(var i=0;i<priceAlarm.length;i++){
      ListElement myListElement=new ListElement(type: "cost",value: priceAlarm[i]);
      lst.add(myListElement);
    }
    obj.list=lst;

    return alarmToJson(obj);
  }

  void postAlarm(headers) async{
    var body=initBody();
    print(body);
    try{
      isLoading(false);
      var result= await RemoteAlarm.postAlarm(headers,body);
      print("postAlarm: ${result}");
    }finally{
      isLoading(true);
    }

  }

  void getAlarm() async{
    try{
      isLoading(false);
      var result = await RemoteAlarm.fetchAlarm();
      if(result!=null){
        print(result.list);
      }
    }finally{
      isLoading(true);
    }
  }


}
