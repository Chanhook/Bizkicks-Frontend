import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/controller/signUpController.dart';
import 'package:login/main.dart';
import 'package:login/model/register.dart';
import 'package:login/widget/Step1.dart';
import 'package:login/widget/Step2.dart';
import 'package:login/widget/Step3.dart';
import 'package:login/widget/Step4.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController phoneNumberFieldController =
      TextEditingController();

  final TextEditingController authenticationFieldController =
      TextEditingController();

  final TextEditingController emailFieldController=TextEditingController();

  final TextEditingController idFieldController = TextEditingController();

  final TextEditingController pwFieldController = TextEditingController();

  final TextEditingController pw2FieldController = TextEditingController();

  final TextEditingController companyCodeFieldController =
      TextEditingController();

  final TextEditingController nameFieldController = TextEditingController();

  final TextEditingController dateBirthFieldController =
      TextEditingController();

  final TextEditingController licenseNumberFieldController =
      TextEditingController();

  final TextEditingController identificationNumberFieldController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    phoneNumberFieldController.dispose();
    authenticationFieldController.dispose();
    idFieldController.dispose();
    pwFieldController.dispose();
    pw2FieldController.dispose();
    companyCodeFieldController.dispose();
    nameFieldController.dispose();
    dateBirthFieldController.dispose();
    licenseNumberFieldController.dispose();
    identificationNumberFieldController.dispose();
    emailFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpController mySignUpController = Get.put(SignUpController());
    return Scaffold(
        body: Obx(
      () => (mySignUpController.step != 4)
          ? Container(
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
                        SizedBox(
                          width: 86,
                          height: 16,
                          child: Text(
                            "STEP ${mySignUpController.step.value + 1}",
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
                            mySignUpController
                                .title[mySignUpController.step.value],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSans(
                              color: Color(0xfff4f4f4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        if (mySignUpController.step.value == 0)
                          Step1(
                              mySignUpController: mySignUpController,
                              phoneNumberFieldController:
                                  phoneNumberFieldController,
                              authenticationFieldController:
                                  authenticationFieldController,
                              emailFieldController:
                              emailFieldController
                          ),
                        if (mySignUpController.step.value == 1)
                          Step2(
                              mySignUpController: mySignUpController,
                              idFieldController: idFieldController,
                              pwFieldController: pwFieldController,
                              pw2FieldController: pw2FieldController),
                        if (mySignUpController.step.value == 2)
                          Step3(
                              mySignUpController: mySignUpController,
                              companyCodeFieldController:
                                  companyCodeFieldController),
                        if (mySignUpController.step.value == 3)
                          Step4(
                              mySignUpController: mySignUpController,
                              nameFieldController: nameFieldController,
                              dateBirthFieldController:
                                  dateBirthFieldController,
                              licenseNumberFieldController:
                                  licenseNumberFieldController,
                              identificationNumberFieldController:
                                  identificationNumberFieldController),
                      ]),
                    ),
                  )
                ],
              ),
            )
          : Container(
              width: Get.width,
              height: Get.height,
              color: Colors.white,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 140,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: Stack(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff76b2e5),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 29,
                                    height: 24.60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xfff4f4f4),
                                        width: 4,
                                      ),
                                      color: Color(0x7f7f3a44),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 57.67),
                        SizedBox(
                          width: 224,
                          height: 26,
                          child: Text(
                            "회원가입이 완료되었습니다. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfff4f4f4),
                              fontSize: 19,
                              fontFamily: "IBM Plex Sans",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 57.67),
                        SizedBox(
                          width: 304,
                          height: 63,
                          child: Text(
                            "로그인 후, 비즈킥스의 다양한 컨텐츠를 \n이용하실 수 있습니다.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffcdcdcd),
                              fontSize: 12,
                              fontFamily: "IBM Plex Sans",
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        SizedBox(height: 57.67),
                        Container(
                          width: 298,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Register myRegister = new Register(
                                      id: mySignUpController.id.value,
                                      name: mySignUpController.name.value,
                                      password: mySignUpController.pw2.value,
                                      phoneNumber:
                                          mySignUpController.phoneNumber.value,
                                      license: true,
                                    companyCode: mySignUpController.companyCode.value,
                                    userRole:mySignUpController.type[1],
                                      email:mySignUpController.email.value
                                  );
                                  var body = registerToJson(myRegister);
                                  print(body);
                                  await mySignUpController.postSignUP(body);
                                  Get.offAll(()=>NewLoginPage());
                                  Get.delete<SignUpController>();
                                },
                                child: Container(
                                  width: 298,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: Color(0xa582e3f8),
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 69,
                                    right: 65,
                                    top: 14,
                                    bottom: 15,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 164,
                                        child: Text(
                                          "비즈킥스 이용하러 가기",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xfff4f4f4),
                                            fontSize: 16,
                                            fontFamily: "IBM Plex Sans",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    ));
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff76b2e5),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 29,
                              height: 24.60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xfff4f4f4),
                                  width: 4,
                                ),
                                color: Color(0x7f7f3a44),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 57.67),
                  SizedBox(
                    width: 224,
                    height: 26,
                    child: Text(
                      "회원가입이 완료되었습니다. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xfff4f4f4),
                        fontSize: 19,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 57.67),
                  SizedBox(
                    width: 304,
                    height: 63,
                    child: Text(
                      "로그인 후, 비즈킥스의 다양한 컨텐츠를 \n이용하실 수 있습니다.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffcdcdcd),
                        fontSize: 12,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(height: 57.67),
                  Container(
                    width: 298,
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offAll(NewLoginPage());
                          },
                          child: Container(
                            width: 298,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Color(0xa582e3f8),
                            ),
                            padding: const EdgeInsets.only(
                              left: 69,
                              right: 65,
                              top: 14,
                              bottom: 15,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 164,
                                  child: Text(
                                    "비즈킥스 이용하러 가기",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xfff4f4f4),
                                      fontSize: 16,
                                      fontFamily: "IBM Plex Sans",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

class MyStepper extends StatelessWidget {
  const MyStepper({
    @required this.mc,
  });

  final SignUpController mc;

  @override
  Widget build(BuildContext context) {
    var blue = Color(0xff88CAF1);
    var white = Color(0xffFAFAFA);
    return Obx(() => Container(
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
                      (mc.step.value == 0)
                          ? BlueKickboard()
                          : SizedBox(width: 8),
                      (mc.step.value == 1)
                          ? BlueKickboard()
                          : SizedBox(width: 8),
                      (mc.step.value == 2)
                          ? BlueKickboard()
                          : SizedBox(width: 8),
                      (mc.step.value == 3)
                          ? BlueKickboard()
                          : SizedBox(width: 8),
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
        ));
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
