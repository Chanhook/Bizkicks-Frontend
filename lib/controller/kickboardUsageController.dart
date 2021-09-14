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

  var image="".obs;
  var model="".obs;
  var battery=0.obs;

  callIncrement() {
    timer.value += 1;
  }
  stop(){
    run=false;
  }
  getLocation(){
    location_list.forEach((position) {print(position);});
    print("cycle: ${cycle.value}");
  }
  getDistance(){
    if(cycle.value==1){
      return;
    }
    for(var i=0;i<cycle.value-1;i++) {
        distanceInMeters.value += GeolocatorPlatform.instance.distanceBetween(
          location_list[i][0],
          location_list[i][1],
          location_list[i+1][0],
          location_list[i+1][1],
        );
    }
    print("이동거리: ${distanceInMeters.value}");
  }


  @override
  void onInit() {
    timer=0.obs;
    run=true;

    brand="".obs;
    latitude=0.0.obs;
    longitude=0.0.obs;
    cycle=0.obs;
    location_list=[].obs;

    distanceInMeters=0.0.obs;
    coordinates = [].obs;
    Timer.periodic(Duration(seconds: 1), (_) => (run)?callIncrement():stop());
    super.onInit();
  }

}