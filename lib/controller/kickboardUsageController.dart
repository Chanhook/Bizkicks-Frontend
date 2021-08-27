import 'dart:async';

import 'package:get/state_manager.dart';

class KickboardUsageController extends GetxController{
  var timer=0.obs;
  bool run=true;

  callIncrement() {
    timer.value += 1;
  }
  stop(){
    run=false;
  }

  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (_) => (run)?callIncrement():stop());
    super.onInit();
  }
}