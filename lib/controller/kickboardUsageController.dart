import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

class KickboardUsageController extends GetxController{
  var timer=0.obs;
  bool run=true;

  var brand="".obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var cycle=0.obs;
  List location_list=[].obs;



  callIncrement() {
    timer.value += 1;
  }
  stop(){
    run=false;
  }
  getLocation(){
    location_list.forEach((position) {print(position);});
    print(cycle);
  }

  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (_) => (run)?callIncrement():stop());
    super.onInit();
  }
}