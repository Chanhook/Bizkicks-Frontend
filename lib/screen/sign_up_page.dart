import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/controller/signUpController.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController phoneNumberFieldController =
      TextEditingController();
  final TextEditingController authenticationFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SignUpController mySignUpController = Get.put(SignUpController());
    return Scaffold(
      body: Obx(()=>Container(
        width: Get.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xb54f32c3), Color(0xff1a2e99)],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                            width: 50,
                            child: InkWell(
                                onTap: () {
                                  mySignUpController.prev();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ))),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                        "회원가입",
                        style: TextStyle(color: Colors.white),
                      ))),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                  MyStepper(
                    mc: mySignUpController,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 86,
                          height: 16,
                          child: Text(
                            "STEP 1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfff4f4f4),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 168,
                          height: 18,
                          child: Text(
                            "휴대폰 번호 인증하기",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSans(
                              color: Color(0xfff4f4f4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
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
                                        color: mySignUpController.colorList[mySignUpController.phonecolorIndex.value],
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
                                    onSubmitted: (value){mySignUpController.phoneNumber.value=value;
                                    mySignUpController.phonecolorIndex.value=mySignUpController.changeColor(mySignUpController.phonecolorIndex.value);

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
                                  onTap: (){
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
                                              color: mySignUpController.colorList[mySignUpController.phonecolorIndex.value],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 12,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 64,
                                                child: Text(
                                                  "인증번호 발송",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: mySignUpController.fontList[mySignUpController.phonecolorIndex.value],
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
                        (!mySignUpController.isSendingMsg.value)?Container(height:38,child: SizedBox(height: 38,))
                            :
                        Container(
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
                        )
                        ,
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
                                        color: mySignUpController.colorList[mySignUpController.authenticationColorIndex.value],
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
                                    onSubmitted: (value){mySignUpController.authenticationNumber.value=value;
                                    mySignUpController.authenticationColorIndex.value=mySignUpController.changeColor(mySignUpController.authenticationColorIndex.value);

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
                                  onTap: (){
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
                                            color: mySignUpController.colorList[mySignUpController.authenticationColorIndex.value],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 12,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 64,
                                                child: Text(
                                                  "인증번호 확인",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: mySignUpController.fontList[mySignUpController.authenticationColorIndex.value],
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
                        (!mySignUpController.isRightAuthentication.value)?SizedBox(height: 38,)
                            :
                        Container(
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
                        )
                        ,

                        SizedBox(height: 58),
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
                                  color: mySignUpController.colorList[mySignUpController.successColorIndex.value],
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
                                    SizedBox(
                                      width: 147,
                                      child: Text(
                                        "휴대폰 번호 인증 완료",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: mySignUpController.fontList[mySignUpController.successColorIndex.value],
                                          fontSize: 16,
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
                  ),
                ]),
              ),
            )
          ],
        ),
      ),)
    );
  }
}

class MyStepper extends StatelessWidget {
  const MyStepper({
    @required this.mc,
  });

  final SignUpController mc;

  @override
  Widget build(BuildContext context) {
    var index = mc.step.value;
    var blue = Color(0xff88CAF1);
    var white = Color(0xffFAFAFA);
    return Container(
      width: Get.width,
      height: 120,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 18,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (index == 0) BlueKickboard(),
                  if (index != 0) SizedBox(width: 8),
                  if (index == 1) BlueKickboard(),
                  if (index != 1) SizedBox(width: 8),
                  if (index == 2) BlueKickboard(),
                  if (index != 2) SizedBox(width: 8),
                  if (index == 3) BlueKickboard(),
                  if (index != 3) SizedBox(width: 8),
                ],
              ),
            ),
            SizedBox(height: 7.05),
            Container(
              width: 120,
              height: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mc.step.value == 0 ? blue : white,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mc.step.value == 1 ? blue : white,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mc.step.value == 2 ? blue : white,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mc.step.value == 3 ? blue : white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlueKickboard extends StatelessWidget {
  const BlueKickboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/blueKickboard.png'),
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
