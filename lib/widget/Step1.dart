import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login/controller/signUpController.dart';

class Step1 extends StatelessWidget {
  const Step1({
    Key key,
    @required this.mySignUpController,
    @required this.phoneNumberFieldController,
    @required this.authenticationFieldController,
    @required this.emailFieldController,
  }) : super(key: key);

  final SignUpController mySignUpController;
  final TextEditingController phoneNumberFieldController;
  final TextEditingController authenticationFieldController;
  final TextEditingController emailFieldController;
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 299,
            height: 50,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: mySignUpController.colorList[
                          mySignUpController.phonecolorIndex.value],
                          width: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 26,
                  child: SizedBox(
                    width: 199,
                    height: 18,
                    child: TextField(
                      onSubmitted: (value) {
                        mySignUpController.phoneNumber.value = value;
                        mySignUpController.phonecolorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController.phonecolorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: phoneNumberFieldController,
                      decoration: const InputDecoration(
                        hintText: "휴대폰 번호를 입력해 주세요",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xffb5b5b5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 215,
                  top: 6,
                  child: InkWell(
                    onTap: () {
                      mySignUpController.changeIsSendingMsg();
                    },
                    child: Container(
                      width: 76,
                      height: 38,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 76,
                            height: 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: mySignUpController.colorList[
                              mySignUpController.phonecolorIndex.value],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 64,
                                  child: Text(
                                    "인증번호 발송",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: mySignUpController.fontList[
                                      mySignUpController
                                          .phonecolorIndex.value],
                                      fontSize: 10.70,
                                      fontFamily: "IBM Plex Sans",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          (!mySignUpController.isSendingMsg.value)
              ? Container(
              height: 38,
              child: SizedBox(
                height: 38,
              ))
              : Container(
            height: 38,
            child: Center(
              child: SizedBox(
                width: 225,
                height: 18,
                child: Text(
                  "인증번호가 정상적으로 발송되었습니다.",
                  style: TextStyle(
                    color: Color(0xff77bfe9),
                    fontSize: 11,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 299,
            height: 50,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: mySignUpController.colorList[
                          mySignUpController
                              .authenticationColorIndex.value],
                          width: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 26,
                  child: SizedBox(
                    width: 199,
                    height: 18,
                    child: TextField(
                      onSubmitted: (value) {
                        mySignUpController.authenticationNumber.value =
                            value;
                        mySignUpController.authenticationColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .authenticationColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: authenticationFieldController,
                      decoration: const InputDecoration(
                        hintText: "인증 번호를 입력해 주세요",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xffb5b5b5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 215,
                  top: 6,
                  child: InkWell(
                    onTap: () {
                      mySignUpController.changeIsRightAuthentication();
                    },
                    child: Container(
                      width: 76,
                      height: 38,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 76,
                            height: 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: mySignUpController.colorList[
                              mySignUpController
                                  .authenticationColorIndex.value],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 64,
                                  child: Text(
                                    "인증번호 확인",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: mySignUpController.fontList[
                                      mySignUpController
                                          .authenticationColorIndex
                                          .value],
                                      fontSize: 10.70,
                                      fontFamily: "IBM Plex Sans",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          (!mySignUpController.isRightAuthentication.value)
              ? SizedBox(
            height: 38,
          )
              : Container(
            height: 38,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: SizedBox(
                  width: 225,
                  height: 18,
                  child: Text(
                    "인증번호 확인이 완료되었습니다.",
                    style: TextStyle(
                      color: Color(0xff77bfe9),
                      fontSize: 11,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: 299,
            height: 50,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: mySignUpController.colorList[
                          mySignUpController
                              .authenticationColorIndex.value],
                          width: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 26,
                  child: SizedBox(
                    width: 199,
                    height: 18,
                    child: TextField(
                      onSubmitted: (value) {
                        mySignUpController.email.value =
                            value;
                        mySignUpController.emailColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .emailColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: emailFieldController,
                      decoration: const InputDecoration(
                        hintText: "이메일을 입력해 주세요",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xffb5b5b5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: 298,
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 298,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: mySignUpController.colorList[
                    mySignUpController.successColorIndex.value],
                  ),
                  padding: const EdgeInsets.only(
                    left: 77,
                    right: 74,
                    top: 14,
                    bottom: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          mySignUpController.next();
                        },
                        child: SizedBox(
                          width: 147,
                          child: Text(
                            "인증 완료",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: mySignUpController.fontList[
                              mySignUpController
                                  .successColorIndex.value],
                              fontSize: 16,
                              fontFamily: "IBM Plex Sans",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 11,
          ),
          SizedBox(
            width: 294,
            height: 52,
            child: Text(
              "원활한 서비스 인증을 위해 최초 1회 인증이 필요합니다. 동일한 연락처로 최대 1개 계정을 생성할 수 있습니다.",
              style: TextStyle(
                color: Color(0xfff4f4f4),
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
