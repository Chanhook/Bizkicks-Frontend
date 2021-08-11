import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
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

  final List<Widget> _contractList=[ContractListBackground()];
  final List<Widget> _contracting=[];
  final List<Widget> _dashboard=[];
  final List<Widget> _myPage=[];

  @override
  Widget build(BuildContext context) {
    // final MRPriceController mrpController = Get.put(MRPriceController());
    // final TotalContractController tcController = Get.put(TotalContractController());
    final CheckContractController ccController =
        Get.put(CheckContractController());
    //print(tcController.productList);
    final ManagerController mc = Get.put(ManagerController());

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
  const ContractListBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      Column(children: [
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
      ])
    ]);
  }
}

