import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/contract_screen.dart';
import 'package:login/controller/checkContractController.dart';
import 'package:login/controller/mrpricecontroller.dart';
import 'package:login/controller/totalContractController.dart';
import 'package:login/dashboard_screen.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/mypage_screen.dart';

import 'contractList_widget.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({Key key}) : super(key: key);

  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    ContractList(),
    Contract(),
    DashBoard(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    final MRPriceController mrpController = Get.put(MRPriceController());
    final TotalContractController tcController = Get.put(TotalContractController());
    final CheckContractController ccController = Get.put(CheckContractController());
    //print(tcController.productList);
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
  }
}

Widget menu() {
  return TabBar(tabs: [
    Tab(
      text: "계약목록",
    ),
    Tab(
      text: "계약하기",
    ),
    Tab(
      text: "대시보드",
    ),
    Tab(
      text: "마이페이지",
    ),
  ]);
}
