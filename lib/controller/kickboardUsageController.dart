import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class KickboardUsageController extends GetxController{
  var timer=0.obs;
  bool run=true;

  var brand="".obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var cycle=0.obs;
  List location_list=[].obs;

  var distanceInMeters=0.0.obs;
  var coordinates = [].obs;

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
  getDistance(){
    for(var i=0;i<cycle.value-2;i++) {
        distanceInMeters.value += GeolocatorPlatform.instance.distanceBetween(
          location_list[i][0],
          location_list[i][1],
          location_list[i+1][0],
          location_list[i+1][1],
        );
    }
    print(distanceInMeters.value);
  }


  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (_) => (run)?callIncrement():stop());
    distanceInMeters.value=0.0;
    super.onInit();
  }
}