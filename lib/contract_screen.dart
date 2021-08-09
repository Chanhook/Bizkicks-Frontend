import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/managerController.dart';

class Contract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());

    return Stack(children: [
      Container(
        width: Get.width,
        height: Get.height,
        color: Color(0xff3e44ae),
      ),
      Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: Color(0xe0ffffff),
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  mc.originalState();
                  Get.to(MeasuredModelContract());
                },
                child: Container(
                  width: 290,
                  height: 238,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        width: 164.26,
                        height: 39.51,
                        child: Text(
                          "종량제 모델",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSans(
                            color: Color(0xff715cc8),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        " 사용한 시간만큼\n결제하는 모델입니다.\n\n",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 290,
                height: 238,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      width: 164.26,
                      height: 39.51,
                      child: Text(
                        "정액제 모델",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          color: Color(0xff715cc8),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      "이용시간 * 업체별 금액만큼 \n결제하는 모델입니다.\n\n",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

//계약하기 종량제 모델 - 1단계 - 종량제 모델 설명
class MeasuredModelContract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "계약하기",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSans(
            color: Color(0xff4a50b3),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      //종량제 1단계 2단계 3단계 보여줄 리스
      body: Obx(() => mc.stepList[mc.step.value]),
    );
  }
}

class ContractThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());
    return Container(
      child: Column(
        children: [
          MyStepper(mc: mc),
          PrevNextBtns(mc: mc),
        ],
      ),
    );
  }
}

class ContractSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());
    return Container(
      child: Column(
        children: [
          MyStepper(mc: mc),
          PrevNextBtns(
            mc: mc,
          ),
        ],
      ),
    );
  }
}

class Contractfirst extends StatelessWidget {
  const Contractfirst({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.find();
    mc.originalState();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          MyStepper(
            mc: mc,
          ),
          Container(
            height: 500,
            child: Center(
              child: Text("종량제 모델 설명"),
            ),
          ),
          PrevNextBtns(mc: mc),
        ],
      ),
    );
  }
}

class PrevNextBtns extends StatelessWidget {
  const PrevNextBtns({
    Key key,
    @required this.mc,
  }) : super(key: key);

  final ManagerController mc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: () {
              if (mc.step.value != 0) {
                mc.prevStep();
              } else {
                Get.back();
              }
            },
            child: PrevBtn()),
        SizedBox(
          width: 10,
        ),
        // Figma Flutter Generator Rectangle117Widget - RECTANGLE
        InkWell(
            onTap: () {
              mc.nextStep();
            },
            child: NextBtn()),
      ],
    );
  }
}

//이전
class PrevBtn extends StatelessWidget {
  const PrevBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 108,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 5,
                  offset: Offset(1, 5),
                ),
              ],
              color: Color(0xffc7c8d1),
            ),
            padding: const EdgeInsets.only(
              top: 14,
              bottom: 15,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "이전",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfff4f4f4),
                    fontSize: 16,
                    fontFamily: "IBM Plex Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//다음
class NextBtn extends StatelessWidget {
  const NextBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 108,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 5,
                  offset: Offset(1, 5),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff25349f),
                  Color(0xff826ed5),
                  Color(0xff826ed5)
                ],
              ),
            ),
            padding: const EdgeInsets.only(
              top: 14,
              bottom: 15,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "다음",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfff4f4f4),
                    fontSize: 16,
                    fontFamily: "IBM Plex Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//킥보드랑 ...
class MyStepper extends StatelessWidget {
  const MyStepper({
    Key key,
    @required this.mc,
  }) : super(key: key);

  final ManagerController mc;

  @override
  Widget build(BuildContext context) {
    var index = mc.step.value;
    return Center(
      child: Container(
        width: 90,
        height: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 0)
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 0, right: 60, bottom: 0),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/kickboard.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            if (index == 1)
              Padding(
                padding:
                    const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/kickboard.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            if (index == 2)
              Padding(
                padding: const EdgeInsets.only(
                    left: 60, top: 0, right: 0, bottom: 0),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/kickboard.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            SizedBox(height: 7.05),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 70,
                height: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mc.step.value == 0
                            ? Color(0xff715cc8)
                            : Color(0xffc1c1c1),
                      ),
                    ),
                    SizedBox(width: 23),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mc.step.value == 1
                            ? Color(0xff715cc8)
                            : Color(0xffc1c1c1),
                      ),
                    ),
                    SizedBox(width: 23),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mc.step.value == 2
                            ? Color(0xff715cc8)
                            : Color(0xffc1c1c1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
