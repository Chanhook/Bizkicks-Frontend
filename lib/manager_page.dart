import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:login/contract_screen.dart';
import 'package:login/controller/checkContractController.dart';
import 'package:login/controller/managerController.dart';
import 'package:login/controller/mrpricecontroller.dart';
import 'package:login/controller/totalContractController.dart';
import 'package:login/dashboard_screen.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/mypage_screen.dart';
import 'package:login/widget/test.dart';

import 'contractList_widget.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({Key key}) : super(key: key);

  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  int _selectedIndex = 0;
  final List<String> titles=["계약목록","계약하기","대시보드","마이페이지"];
  final List<Widget> _children = [
    ContractList(),
    Contract(),
    DashBoard(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    // final MRPriceController mrpController = Get.put(MRPriceController());
    // final TotalContractController tcController = Get.put(TotalContractController());
    final CheckContractController ccController =
        Get.put(CheckContractController());
    //print(tcController.productList);
    final ManagerController mc = Get.put(ManagerController());

    return Obx(()=>Scaffold(
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
      body: Stack(
        children: [
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
        ]
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, //Bar의 배경색
        selectedItemColor: Color(0xff3e44ae), //선택된 아이템의 색상
        unselectedItemColor: Color(0xff999999), //선택 안된 아이템의 색상
        selectedFontSize: 14, //선택된 아이템의 폰트사이즈
        unselectedFontSize: 14, //선택 안된 아이템의 폰트사이즈
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) { //눌렀을 경우 어떻게 행동할지
          mc.title.value=titles[index];
          setState(() { //setState()를 추가하여 인덱스를 누를때마다 빌드를 다시함
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
    /*
    return Scaffold(
      appBar: new AppBar(
        title: Text("manager"),
        automaticallyImplyLeading: false,
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        currentIndex: _selectedIndex,
        //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            //print(_selectedIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('계약목록'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('계약하기'),
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            title: Text('대시보드'),
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            title: Text('마이페이지'),
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
    */
  }
}
