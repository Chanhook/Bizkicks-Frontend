import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:login/services/remote_signUp.dart';

class SignUpController extends GetxController {
  var isLoading=true.obs;
  var step = 0.obs;
  var phoneNumber = "".obs;
  var authenticationNumber = "".obs;
  var email="".obs;
  var id = "".obs;
  var pw = "".obs;
  var pw2 = "".obs;
  var companyCode = "".obs;
  var name = "".obs;
  var dateBirth = "".obs;
  var licenseNumber = "".obs;
  var identificationNumber = "".obs;
  var type=["ROLE_USER","ROLE_MANAGER"];
  var license=true;


  var phonecolorIndex = 0.obs;
  var authenticationColorIndex = 0.obs;
  var emailColorIndex=0.obs;
  var successColorIndex = 0.obs;
  var idColorIndex = 0.obs;
  var pwColorIndex = 0.obs;
  var pw2ColorIndex = 0.obs;
  var accountSettingColorIndex = 0.obs;
  var companyCodeColorIndex = 0.obs;
  var nameColorIndex = 0.obs;
  var dateBirthColorIndex = 0.obs;
  var licenseNumberColorIndex = 0.obs;
  var identificationNumberColorIndex = 0.obs;

  var isSendingMsg = false.obs;
  var isRightAuthentication = false.obs;
  var successAuthentication = false.obs;
  var isDuplicated = false.obs;
  var isSamePassword = false.obs;
  var accountSetting = false.obs;
  var isRightCompanyCode = false.obs;

  List<dynamic> colorList = [Color(0x5982e3f8), Color(0xb282e3f8)];
  List<dynamic> fontList = [Color(0xffb5b5b5), Color(0xf4f4f4f4)];
  List<String> title = ["인증하기", "계정 설정하기", "회사 코드 입력하기", "운전면허증 등록하기"];

  @override
  void onInit() {
    step = 0.obs;
    phoneNumber = "".obs;
    authenticationNumber = "".obs;
    email="".obs;
    id = "".obs;
    pw = "".obs;
    pw2 = "".obs;
    companyCode = "".obs;

    phonecolorIndex = 0.obs;
    authenticationColorIndex = 0.obs;
    successColorIndex = 0.obs;
    idColorIndex = 0.obs;
    pwColorIndex = 0.obs;
    pw2ColorIndex = 0.obs;
    accountSettingColorIndex = 0.obs;
    companyCodeColorIndex = 0.obs;

    isSendingMsg = false.obs;
    isRightAuthentication = false.obs;
    successAuthentication = false.obs;
    isDuplicated = false.obs;
    isSamePassword = false.obs;
    accountSetting = false.obs;
    isRightCompanyCode = false.obs;

    super.onInit();
  }

  void next() => step.value++;

  void prev() {
    (step.value <= 0) ? Get.back() : step.value--;
    phonecolorIndex.value = 0;
  }

  int changeColor(index) {
    return (index == 0) ? 1 : 0;
  }

  void changeIsSendingMsg() {
    if (isSendingMsg.value == false) isSendingMsg.value = true;
  }

  void changeIsRightAuthentication() {
    if (isRightAuthentication.value == false) {
      isRightAuthentication.value = true;
      successColorIndex.value = 1;
    }
  }

  void checkDuplicated() {
    if (isDuplicated.value == false) {
      isDuplicated.value = true;
    }
  }

  void checkPassword() {
    if (pw.value == pw2.value) {
      isSamePassword.value = true;
      accountSetting.value = true;
      accountSettingColorIndex.value =
          changeColor(accountSettingColorIndex.value);
    }
  }

  void checkCompanyCode() {
    if (isRightCompanyCode.value = false) isRightCompanyCode.value = true;
  }


  //api
  void postSignUP(body) async{
    try{
      isLoading(true);
      var result=await RemoteSignUp.postSignUp(body);
      print("post: ${result}");
    }finally{
      isLoading(false);
    }
  }
  void postLicense(body) async{
    try{
      isLoading(true);
      var result=await RemoteSignUp.postLicense(body);
      print("post: ${result}");
    }finally{
      isLoading(false);
    }
  }


}
