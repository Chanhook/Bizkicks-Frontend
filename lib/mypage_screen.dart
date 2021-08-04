import 'package:flutter/material.dart';
import 'package:login/screen/login_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
            title: Text(
              "마이페이지",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
            //trailing: Icon(Icons.navigate_next),
            //onTap: () {},
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
              title: Text("카드등록"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {}),
          ListTile(
              title: Text("비밀번호 변경"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {}),
          ListTile(
              title: Text("로그아웃"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              }),
          SizedBox(
            height: 5,
          ),
          ListTile(
              title: Text(
                "고객문의",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              //trailing: Icon(Icons.navigate_next),
              //onTap: () {}
              ),
          ListTile(
              title: Text("고객문의 바로가기"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {}),
          ListTile(
              title: Text("자주 묻는 질문"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {}),
          SizedBox(
            height: 5,
          ),
          ListTile(
              title: Text(
                "앱정보",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              //trailing: Icon(Icons.navigate_next),
              //onTap: () {}
              ),
          ListTile(
              title: Text("버전 체크"),
              trailing: Text("현재 0.1.0/최신 0.1.1"),
              onTap: () {}),
        ],
      ),
    );
  }
}
