import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login/controller/signUpController.dart';

class Step4 extends StatelessWidget {
  const Step4({
    Key key,
    @required this.mySignUpController,
    @required this.nameFieldController,
    @required this.dateBirthFieldController,
    @required this.licenseNumberFieldController,
    @required this.identificationNumberFieldController,
  }) : super(key: key);

  final SignUpController mySignUpController;
  final TextEditingController nameFieldController;
  final TextEditingController dateBirthFieldController;
  final TextEditingController licenseNumberFieldController;
  final TextEditingController identificationNumberFieldController;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SingleChildScrollView(
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
                          mySignUpController
                              .nameColorIndex.value],
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
                        mySignUpController.name.value = value;
                        mySignUpController.nameColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .nameColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: nameFieldController,
                      decoration: const InputDecoration(
                        hintText: "성명을 입력해 주세요",
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
            height: 38,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: SizedBox(
                  width: 225,
                  height: 18,
                  child: Text(
                    "운전면허증의 성명과 동일하게 입력해 주세요.",
                    style: TextStyle(
                      color: Color(0xfff3f3f3),
                      fontSize: 11,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
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
                              .dateBirthColorIndex.value],
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
                      onTap: () async {
                        var date =  await showDatePicker(
                            context: context,
                            initialDate:DateTime.now(),
                            firstDate:DateTime(1900),
                            lastDate: DateTime(2100));
                        dateBirthFieldController.text = date.toString().substring(0,10);
                      },
                      onSubmitted: (value) {
                        mySignUpController.dateBirth.value = value;
                        mySignUpController.dateBirthColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .dateBirthColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: dateBirthFieldController,
                      decoration: const InputDecoration(
                        hintText: "생년월일을 입력하여 주세요.",
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
          SizedBox(height: 38),
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
                              .licenseNumberColorIndex.value],
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
                        mySignUpController.licenseNumber.value = value;
                        mySignUpController.licenseNumberColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .licenseNumberColorIndex.value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: licenseNumberFieldController,
                      decoration: const InputDecoration(
                        hintText: "면허번호를 입력하여 주세요.",
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
          SizedBox(height: 38),
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
                              .identificationNumberColorIndex.value],
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
                        mySignUpController.identificationNumber.value = value;
                        mySignUpController.identificationNumberColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .identificationNumberColorIndex.value);

                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: identificationNumberFieldController,
                      decoration: const InputDecoration(
                        hintText: "식별번호를 입력해 주세요",
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
          SizedBox(height: 28),
          SizedBox(
            width: 290,
            height: 57,
            child: Text(
              "식별번호는 운전면허증 앞면 우측 작은 사진 밑에 있는 6자리 또는 5자리 숫자/영문 대문자를 입력 바랍니다. 만약, 식별번호가 없으면 빈칸으로 조회하시기 바랍니다.",
              style: TextStyle(
                color: Color(0xfff4f4f4),
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 28),
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
                        .identificationNumberColorIndex.value],
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
                          List data=[mySignUpController.dateBirth.value.replaceAll("-", ""),mySignUpController.name.value,mySignUpController.licenseNumber.value,mySignUpController.identificationNumber.value];
                          var jsonString = '{"date_of_birth" : "${data[0]}","name" : "${data[1]}","license_number" : "${data[2]}","identify_number" : "${data[3]}"}';
                          print(jsonString);
                          mySignUpController.postLicense(jsonEncode(jsonString));

                          mySignUpController.next();
                        },
                        child: SizedBox(
                          width: 147,
                          child: Text(
                            "운전면허증 등록 완료",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: mySignUpController.fontList[mySignUpController.identificationNumberColorIndex.value],
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
