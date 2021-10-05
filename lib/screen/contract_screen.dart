import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:login/controller/checkContractController.dart';
import 'package:login/controller/userController.dart';
import 'package:login/model/totalcontract.dart';

import '../controller/managerController.dart';
import 'manager_page.dart';

class Contract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());
    final CheckContractController checkContractController = Get.find();

    return Obx(() => Stack(children: [
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
          !checkContractController.isContracted.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            mc.originalState();
                            mc.type = "membership";
                            Get.to(() => MeasuredModelContract());
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
                                    "비즈킥스 멤버십",
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
                        onTap: () {
                          mc.originalState();
                          mc.type = "plan";
                          Get.to(() => PlanContract());
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
                                  "비즈킥스 플랜",
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
                )
              : Container(
                  child: Center(
                    child: Text("이미 계약 완료"),
                  ),
                ),
        ]));
  }
}

class PlanContract extends StatelessWidget {
  const PlanContract({Key key}) : super(key: key);

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
      body: Obx(() => mc.planStep[mc.step.value]),
    );
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

class ContractFourth extends StatelessWidget {
  const ContractFourth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());
    final UserController uc = Get.put(UserController());
    final CheckContractController cc = Get.put(CheckContractController());
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("images/check_icon.png")),
          SizedBox(
            width: 264,
            child: Text(
              "계약이 완료되었습니다. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff3e44ae),
                fontSize: 21,
                fontFamily: "IBM Plex Sans",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 304,
            height: 63,
            child: Text(
              "이용기한:  ${DateFormat('yyyy-MM-dd').format(mc.startDate)} ~ ${DateFormat('yyyy-MM-dd').format(mc.endDate)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff858585),
              ),
            ),
          ),
          SizedBox(
            width: 304,
            height: 63,
            child: Text(
              "직원들을 초대해주세요 !\n아래 다양한 킥보드를 이용하실 수 있습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff988cc8),
                fontSize: 12,
                fontFamily: "IBM Plex Sans",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(child: Image.asset("images/usable_kickboards.png")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                // elevation: MaterialStateProperty.all(3),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Map<String, String> headers = {
                  "authorization": "Bearer ${uc.accessToken}",
                  "Accept": "application/json",
                  "content-type": "application/json"
                };
                if (mc.type == "membership") {
                  _postAlarm(uc, mc, headers);
                  _postContract(mc, cc, headers);
                } else {
                  var contracts = [];
                  for (var i = 0; i < mc.kickboard_companys.length; i++) {
                    if (mc.contract_times[i] != 0) {
                      var obj = {};
                      obj["brandname"] = mc.kickboard_brand[i];
                      obj["totaltime"] = mc.contract_times[i];
                      contracts.add(obj);
                    }
                  }
                  var body = jsonEncode({
                    "type": "plan",
                    "startdate":
                        "${DateFormat('yyyy-MM-dd').format(mc.startDate)}",
                    "list": contracts
                  });
                  print(body);
                  cc.postContract(headers, body);
                }
                Navigator.pop(context);
              },
              child: Container(
                width: 298,
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
                child: Center(child: Text("계약목록 보러가기")),
              ))
        ],
      ),
    );
  }

  void _postContract(ManagerController mc, CheckContractController cc,
      Map<String, String> headers) {
    var body = jsonEncode({
      "type": "membership",
      "duedate": "${DateFormat('yyyy-MM-dd').format(mc.endDate)}",
      "startdate": "${DateFormat('yyyy-MM-dd').format(mc.startDate)}"
    });
    if (DateFormat('yyyy-MM-dd').format(mc.endDate) is String) {
      print("스트링임");
    } else {
      print('e');
    }
    print(body);
    cc.postContract(headers, body);
  }

  void _postAlarm(
      UserController uc, ManagerController mc, Map<String, String> headers) {
    mc.postAlarm(headers);
  }
}

//계약하기 공용 - 3단계 - 계약서
class ContractThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());
    return Container(
      child: Column(
        children: [
          MyStepper(mc: mc),
          Container(
            width: 314,
            height: 600,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~계약서~\n",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: 0.91,
                  ),
                ),
              ),
            ),
          ),
          PrevNextBtns(mc: mc),
        ],
      ),
    );
  }
}

//계약하기 종량제 모델 - 2단계 - 알림 설정
class ContractSecond extends StatefulWidget {
  ContractSecond({
    Key key,
    @required this.type,
  }) : super(key: key);
  final type;

  @override
  _ContractSecondState createState() => _ContractSecondState();
}

class _ContractSecondState extends State<ContractSecond> {
  final TextEditingController _textFieldController = TextEditingController();

  double product_width = 358;

  double product_height = 122;

  List<bool> checked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final ManagerController mc = Get.put(ManagerController());

    if (this.widget.type == 'membership')
      return Obx(() => Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyStepper(mc: mc),
                  Container(
                    height: 600,
                    width: Get.width - 60,
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 83,
                                    height: 18,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          child: Icon(
                                            Icons.access_time_outlined,
                                            size: 15,
                                            color: Color(0xff4a50b3),
                                          ),
                                        ),
                                        SizedBox(width: 9),
                                        Text(
                                          "시간 알림",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            color: Color(0xff4a50b3),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _displayTimeDialog(context, mc);
                                      print(mc.timeAlarm);
                                    },
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 34,
                                            height: 34,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x1e000000),
                                                  blurRadius: 2,
                                                  offset: Offset(0, -1),
                                                ),
                                                BoxShadow(
                                                  color: Color(0x1e000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                            child: Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              mc.timeAlarm.length != 0
                                  ? Container(
                                      height: 200,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: mc.timeAlarm.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 341,
                                              height: 54,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x19000000),
                                                    blurRadius: 2,
                                                    offset: Offset(0, -1),
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0x19000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(
                                                  "${mc.timeAlarm[index]}시간 이상 도달 시 알림",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                trailing: IconButton(
                                                  iconSize: 24,
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    mc.timeAlarm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container(
                                      height: 150,
                                    ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xffdddddd),
                        ),
                        //금액
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 83,
                                    height: 18,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          child: Text(
                                            "₩",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff4a50b3),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 9),
                                        Text(
                                          "금액 알림",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            color: Color(0xff4a50b3),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _displayPriceDialog(context, mc);
                                    },
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 34,
                                            height: 34,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x1e000000),
                                                  blurRadius: 2,
                                                  offset: Offset(0, -1),
                                                ),
                                                BoxShadow(
                                                  color: Color(0x1e000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                            child: Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              mc.priceAlarm.length != 0
                                  ? Container(
                                      height: 200,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: mc.priceAlarm.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 341,
                                              height: 54,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x19000000),
                                                    blurRadius: 2,
                                                    offset: Offset(0, -1),
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0x19000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                title: Text(
                                                  "${mc.priceAlarm[index]}원 이상 도달 시 알림",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                trailing: IconButton(
                                                  iconSize: 24,
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    mc.priceAlarm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container(
                                      height: 150,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PrevNextBtns(
                    mc: mc,
                  ),
                ],
              ),
            ),
          ));
    else
      return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyStepper(mc: mc),
              Container(
                height: 600,
                width: Get.width - 60,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: mc.kickboard_companys.length,
                    itemBuilder: (BuildContext context, int index) {
                      var n = mc.kickboard_companys[index].keys;
                      var name =
                          n.toString().replaceAll("(", "").replaceAll(")", "");
                      var img = mc.kickboard_companys[index].values;
                      var image = img
                          .toString()
                          .replaceAll("(", "")
                          .replaceAll(")", "");
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: product_width,
                            height: 150,
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
                            child: Row(
                              children: [
                                Container(
                                  child: Center(
                                    child: Image.asset(
                                      "images/${image}.png",
                                      width: 96,
                                      height: 96,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: product_width - 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${name}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "IBM Plex Sans",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Container(
                                              width: 22,
                                              height: 22,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (!checked[index]) {
                                                      _setUsingTimeDialog(index,
                                                          checked, context, mc);
                                                    } else {
                                                      checked[index] =
                                                          !checked[index];
                                                      mc.contract_times[index] =
                                                          0;
                                                    }
                                                    print(checked[index]);
                                                  });
                                                },
                                                child: checked[index]
                                                    ? Image.asset(
                                                        "images/checkBox_on.png",
                                                        width: 2,
                                                        height: 2,
                                                      )
                                                    : Image.asset(
                                                        "images/checkBox_off.png",
                                                        width: 2,
                                                        height: 2,
                                                      ),
                                              )),
                                        ],
                                      ),
                                      Text(
                                        "10000원/시간",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "서비스지역: ",
                                        style: TextStyle(
                                          color: Color(0xff969696),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "최소시간 30시간",
                                        style: TextStyle(
                                          color: Color(0xff969696),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "보험제공/헬멧제공",
                                        style: TextStyle(
                                          color: Color(0xff969696),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              ),
              PrevNextBtns(
                mc: mc,
              ),
            ],
          ),
        ),
      );
  }

  Future<AlertDialog> _setUsingTimeDialog(int index, List checked,
      BuildContext context, ManagerController mc) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('시간을 설정하세요.'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: '숫자만 입력하세요'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  mc.contract_times[index] =
                      int.parse(_textFieldController.text);
                  setState(() {
                    checked[index] = !checked[index];
                  });
                  _textFieldController.clear();
                  Get.back();
                },
              ),
              // cancel button
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  _textFieldController.clear();
                  Get.back();
                },
              )
            ],
          );
        });
  }

  Future<AlertDialog> _displayTimeDialog(
      BuildContext context, ManagerController mc) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('알림을 받을 시간을 입력하세요.'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: '숫자만 입력하세요'),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  _addAlarmTime(_textFieldController.text, mc);
                  Get.back();
                },
              ),
              // cancel button
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          );
        });
  }

  Future<AlertDialog> _displayPriceDialog(
      BuildContext context, ManagerController mc) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('알림을 받을 금액을 입력하세요.'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: '숫자만 입력하세요'),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  _addAlarmPrice(_textFieldController.text, mc);
                  Get.back();
                },
              ),
              // cancel button
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          );
        });
  }

  void _addAlarmPrice(String price, ManagerController mc) {
    mc.addPriceAlarm(price);
    _textFieldController.clear();
  }

  void _addAlarmTime(String time, ManagerController mc) {
    mc.addTimeAlarm(time);
    _textFieldController.clear();
  }
}

//계약하기 설명 - 1단
class Contractfirst extends StatelessWidget {
  const Contractfirst({
    Key key,
    @required this.s,
  }) : super(key: key);

  final s;

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
            height: 600,
            child: Center(
              child: Text("${s}"),
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
              if (mc.step.value == 3) {
                mc.setDeadline();
              }
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
