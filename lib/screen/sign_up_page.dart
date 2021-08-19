import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/controller/signUpController.dart';
import 'package:login/widget/Step1.dart';
import 'package:login/widget/Step2.dart';
import 'package:login/widget/Step3.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController phoneNumberFieldController =
      TextEditingController();
  final TextEditingController authenticationFieldController =
      TextEditingController();
  final TextEditingController idFieldController = TextEditingController();
  final TextEditingController pwFieldController = TextEditingController();
  final TextEditingController pw2FieldController = TextEditingController();
  final TextEditingController companyCodeFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SignUpController mySignUpController = Get.put(SignUpController());
    return Scaffold(
        body: Obx(
      () => Container(
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
                      mySignUpController.title[mySignUpController.step.value],
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
                  if (mySignUpController.step.value == 0)
                    Step1(
                        mySignUpController: mySignUpController,
                        phoneNumberFieldController: phoneNumberFieldController,
                        authenticationFieldController:
                            authenticationFieldController),
                  if (mySignUpController.step.value == 1)
                    Step2(mySignUpController: mySignUpController, idFieldController: idFieldController, pwFieldController: pwFieldController, pw2FieldController: pw2FieldController),
                  if (mySignUpController.step.value == 2)
                    Step3(mySignUpController: mySignUpController, companyCodeFieldController: companyCodeFieldController),
                ]),
              ),
            )
          ],
        ),
      ),
    ));
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
