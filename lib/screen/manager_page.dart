import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:login/controller/userController.dart';
import 'package:login/screen/contract_screen.dart';
import 'package:login/controller/checkContractController.dart';
import 'package:login/controller/managerController.dart';
import 'package:login/controller/mrpricecontroller.dart';
import 'package:login/controller/totalContractController.dart';
import 'package:login/screen/dashboard_screen.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/screen/mypage_screen.dart';
import 'package:login/widget/contractSelectOne.dart';
import 'package:login/widget/test.dart';

import '../widget/contractList_widget.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({Key key}) : super(key: key);

  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {

  static int _selectedIndex = 0;
  final List<String> titles = ["계약목록", "계약하기", "대시보드", "마이페이지"];



  @override
  Widget build(BuildContext context) {
    // final MRPriceController mrpController = Get.put(MRPriceController());
    // final TotalContractController tcController = Get.put(TotalContractController());
    final CheckContractController ccController =
        Get.put(CheckContractController());
    //print(tcController.productList);
    final ManagerController mc = Get.put(ManagerController());
    final UserController uc=Get.put(UserController());
    ccController.fetchCheckContract(uc.headers);

    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              mc.title.value,
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                color: Color(0xff3e44ae),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: mc.ui.value[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            //Bar의 배경색
            selectedItemColor: Color(0xff3e44ae),
            //선택된 아이템의 색상
            unselectedItemColor: Color(0xff999999),
            //선택 안된 아이템의 색상
            selectedFontSize: 14,
            //선택된 아이템의 폰트사이즈
            unselectedFontSize: 14,
            //선택 안된 아이템의 폰트사이즈
            currentIndex: _selectedIndex,
            //현재 선택된 Index
            onTap: (int index) {
              //눌렀을 경우 어떻게 행동할지
              mc.title.value = titles[index];
              setState(() {
                //setState()를 추가하여 인덱스를 누를때마다 빌드를 다시함
                _selectedIndex = index; //index는 처음 아이템 부터 0, 1, 2, 3
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: '계약목록',
              ),
              BottomNavigationBarItem(
                label: '계약하기',
                icon: Icon(Icons.note_add_outlined),
              ),
              BottomNavigationBarItem(
                label: '대시보드',
                icon: Icon(Icons.insert_chart_outlined),
              ),
              BottomNavigationBarItem(
                label: '마이페이지',
                icon: Icon(Icons.perm_identity),
              ),
            ],
          ),
        ));

  }
}

class ContractListBackground extends StatelessWidget {
  ContractListBackground({
    Key key,
  }) : super(key: key);
  Map<String, String> kickboardImages={"씽씽":"images/Xingxing.png",
    "라임":"images/Lime.png",
    "킥고잉":"images/Kickgoing.png",
  };
  @override
  Widget build(BuildContext context) {
    final CheckContractController contractController=Get.put(CheckContractController());
    return Obx(()=>Stack(children: [
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
      contractController.myKickboards.value==null?NoContract():SingleChildScrollView(
        child: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: contractController.myKickboards.value.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 341,
                    height: 80,
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
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(kickboardImages[contractController.myKickboards.value.list[index].companyName],
                        width: 50,height: 50,),
                        title: Column(
                          children: [
                            Text(
                              "${contractController.myKickboards.value.list[index].companyName}",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "서비스 지역: ${contractController.myKickboards.value.list[index].districts}"
                            ),
                            Text(
                              contractController.myKickboards.value.list[index].helmet?"헬멧 제공":"헬멧 미제공",
                            ),
                            Text(
                              contractController.myKickboards.value.list[index].insurance?"보험 제공":"보 미제공",
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          iconSize: 24,
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    ]));
  }
}

class NoContract extends StatelessWidget {
  const NoContract({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 300,
      ),
      Container(
        child: Center(
          child: Text("계약목록이 없습니다.",
            style: GoogleFonts.roboto(
              color: Color(0xff969696),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
        ),
      ),
      SizedBox(
        height: 250,
      ),
      SizedBox(
        width: 290,
        height: 50,
        child: ElevatedButton(
          onPressed: () {_ManagerPageState._selectedIndex=1;},
          child: Text(
            "계약하러 가기",
            style: GoogleFonts.ibmPlexSans(
              color: Color(0xfff4f4f4),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xff826ED5),
            shape: StadiumBorder(),
          ),
        ),
      )
    ]);
  }
}

