import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:login/screen/measured_rate_page.dart';

import '../screen/contract_screen.dart';
import '../screen/dashboard_screen.dart';
import '../screen/manager_page.dart';
import '../screen/mypage_screen.dart';

class ManagerController extends GetxController {
  var title = "계약 목록".obs;
  dynamic selectedIndex = 0.obs;

  var startDate = DateTime.now();
  var endDate = DateTime.now();

  final RxMap<dynamic, dynamic> ui = {
    0: ContractListBackground(),
    1: Contract(),
    2: DashBoard(),
    3: MyPage(),
    'measuredModel': MeasuredModelContract(),
  }.obs;

  var step = 0.obs;
  final List<dynamic> stepList = [
    Contractfirst(),
    ContractSecond(),
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
}
