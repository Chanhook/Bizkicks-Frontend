import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:login/screen/measured_rate_page.dart';

import '../contract_screen.dart';
import '../dashboard_screen.dart';
import '../manager_page.dart';
import '../mypage_screen.dart';

class ManagerController extends GetxController{
  var title="계약 목록".obs;
  dynamic selectedIndex = 0.obs;
  final RxMap<dynamic, dynamic> ui = {
    0:ContractListBackground(),
    1:Contract(),
    2:DashBoard(),
    3:MyPage(),
    'measuredModel':MeasuredModelContract(),

  }.obs;

  var step=0.obs;
  final List<dynamic> stepList=[
    Contractfirst(),
    ContractSecond(),
    ContractThird(),

  ];

  var test=0.obs;

  final List<int> timeAlarm = <int>[].obs;
  final List<int> priceAlarm = <int>[];

  void originalState() => step.value=0;
  void prevStep()=>step.value--;
  void nextStep() => step.value++;

  void addTimeAlarm(time) {
  timeAlarm.add(int.parse(time));
  test.value++;
  }
  void addPriceAlarm(price){
    priceAlarm.add(int.parse(price));
    update();
  }

}