import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login/controller/signUpController.dart';

class Step3 extends StatelessWidget {
  const Step3({
    Key key,
    @required this.mySignUpController,
    @required this.companyCodeFieldController,
  }) : super(key: key);

  final SignUpController mySignUpController;
  final TextEditingController companyCodeFieldController;

  @override
  Widget build(BuildContext context) {
    return Obx( ()=>SingleChildScrollView(
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
                              .companyCodeColorIndex.value],
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
                        mySignUpController.companyCode.value = value;
                        mySignUpController.companyCodeColorIndex.value =
                            mySignUpController.changeColor(
                                mySignUpController
                                    .companyCodeColorIndex.value);
                        mySignUpController.isRightCompanyCode();
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: companyCodeFieldController,
                      decoration: const InputDecoration(
                        hintText: "회사코드를 입력해 주세요",
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
          (!mySignUpController.isRightCompanyCode.value)
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
                    "코드가 정상적으로 인증되었습니다.",
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
                        .companyCodeColorIndex.value],
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
                            "회사코드 입력 완료",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: mySignUpController.fontList[mySignUpController.companyCodeColorIndex.value],
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
    ) );
  }
}
