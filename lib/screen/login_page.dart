import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/alarmController.dart';
import 'package:login/manager_page.dart';
import 'package:login/screen/create_account_page.dart';
import 'package:login/screen/forgot_page.dart';
import 'package:login/widget/base_map_page.dart';
import 'package:login/widget/marker_map_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isUser = true;

  @override
  Widget build(BuildContext context) {
    AlarmController alarm=Get.put(AlarmController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 150.0,
              width: 190.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('images/logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("기업 회원용 통합 킥보드 앱",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: Text("비즈킥스",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: '이용자',
                          ),
                          Tab(
                            text: '기업 관리',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPage()));
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot ID and Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => ManagerPage()),(route) => false);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(child: TextButton(child: Text('New User? Create Account'),
              onPressed: (){
              Get.to(MarkerMapPage());
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>MarkerMapPage()));
              },),
            )
          ],
        ),
      ),
    );
  }
}
