import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var step = 0.obs;
  var phoneNumber = "".obs;
  var authenticationNumber = "".obs;
  var phonecolorIndex = 0.obs;
  var authenticationColorIndex=0.obs;
  var successColorIndex = 0.obs;



  var isSendingMsg=false.obs;
  var isRightAuthentication=false.obs;
  var successAuthentication=false.obs;


  List<dynamic> colorList = [Color(0x5982e3f8), Color(0xb282e3f8)];
  List<dynamic> fontList = [Color(0xffb5b5b5), Color(0xf4f4f4f4)];


  void next() => step.value++;

  void prev() {
    (step.value <= 0) ? Get.back() : step.value--;
    phonecolorIndex.value = 0;
  }

  int changeColor(index){
    return (index==0)? 1 : 0;
  }

  void changeIsSendingMsg(){
    if(isSendingMsg.value==false)
      isSendingMsg.value=true;

  }
  void changeIsRightAuthentication(){
    if(isRightAuthentication.value==false){
      isRightAuthentication.value=true;
      successColorIndex.value=1;
    }

  }
}
