import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login/controller/signUpController.dart';

class Step2 extends StatelessWidget {
  const Step2({
    Key key,
    @required this.mySignUpController,
    @required this.idFieldController,
    @required this.pwFieldController,
    @required this.pw2FieldController,
  }) : super(key: key);

  final SignUpController mySignUpController;
  final TextEditingController idFieldController;
  final TextEditingController pwFieldController;
  final TextEditingController pw2FieldController;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: 300,
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
                          borderRadius:
                          BorderRadius.circular(80),
                          border: Border.all(
                            color: mySignUpController.colorList[
                            mySignUpController
                                .idColorIndex.value],
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
                          borderRadius:
                          BorderRadius.circular(8),
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
                          mySignUpController.id.value = value;
                          mySignUpController
                              .idColorIndex.value =
                              mySignUpController.changeColor(
                                  mySignUpController
                                      .idColorIndex.value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        controller: idFieldController,
                        decoration: const InputDecoration(
                          hintText: "사용할 아이디를 입력하여 주세요.",
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
                        mySignUpController.checkDuplicated();
                      },
                      child: Container(
                        width: 76,
                        height: 38,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 76,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(20),
                                color: mySignUpController
                                    .colorList[
                                mySignUpController
                                    .idColorIndex.value],
                              ),
                              padding:
                              const EdgeInsets.symmetric(
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
                                      "중복 확인",
                                      textAlign:
                                      TextAlign.center,
                                      style: TextStyle(
                                        color: mySignUpController
                                            .fontList[
                                        mySignUpController
                                            .idColorIndex
                                            .value],
                                        fontSize: 10.70,
                                        fontFamily:
                                        "IBM Plex Sans",
                                        fontWeight:
                                        FontWeight.w600,
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
              )),
          (!mySignUpController.isDuplicated.value)
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
                  "사용가능한 아이디 입니다.",
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
                              .pwColorIndex.value],
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
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      onSubmitted: (value) {
                        mySignUpController.pw.value = value;
                        mySignUpController.pwColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .pwColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: pwFieldController,
                      decoration: const InputDecoration(
                        hintText: "사용할 비밀번호를 입력해 주세요",
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
                              .pw2ColorIndex.value],
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
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      onSubmitted: (value) {
                        mySignUpController.pw2.value = value;
                        mySignUpController.pw2ColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .pw2ColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: pw2FieldController,
                      decoration: const InputDecoration(
                        hintText: "비밀번호를 확인해 주세요",
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
                      mySignUpController.checkPassword();
                    },
                    child: Container(
                      width: 76,
                      height: 38,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 76,
                            height: 38,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              color:
                              mySignUpController.colorList[
                              mySignUpController
                                  .pw2ColorIndex.value],
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
                                    "확인",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: mySignUpController
                                          .fontList[
                                      mySignUpController
                                          .pw2ColorIndex
                                          .value],
                                      fontSize: 10.70,
                                      fontFamily:
                                      "IBM Plex Sans",
                                      fontWeight:
                                      FontWeight.w600,
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
          (!mySignUpController.isSamePassword.value)
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
                    "비밀번호 확인이 완료되었습니다.",
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
                    color: mySignUpController.colorList[
                    mySignUpController
                        .accountSettingColorIndex.value],
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
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          mySignUpController.next();
                        },
                        child: SizedBox(
                          width: 147,
                          child: Text(
                            "계정 설정 완료",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffcdcdcd),
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
          )
        ],
      ),
    ));
  }
}
