import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/screen/after_using_screen.dart';
import 'package:login/screen/kickboard_usage_screen.dart';
import 'package:login/screen/manager_page.dart';
import 'package:login/screen/sign_up_page.dart';
import 'package:login/widget/LoginButton.dart';
import 'package:login/widget/marker_map_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(home: Splash());
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Colors.white,
              ),
              home: //ManagerPage(),
              NewLoginPage(),
            );
          }
        });
  }
}

class NewLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Test(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xe1f5fe).withOpacity(1.0),
      body: Center(child: Image.asset('assets/splash.png')),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(Duration(seconds: 0));
  }
}

class Test extends StatelessWidget {
  final TextEditingController _idFieldController = TextEditingController();
  final TextEditingController _pwFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xb54f32c3), Color(0xff1a2e99)],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                    child: Image.asset(
                  'images/logo.png',
                  width: 200,
                )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 298,
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 298,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: Color(0xd87ac0eb),
                            width: 1.50,
                          ),
                          color: Color(0x00000000),
                        ),
                        padding: const EdgeInsets.only(
                          left: 21,
                          right: 163,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 94,
                              child: TextField(
                                onSubmitted: (value){print(value);},
                                controller: _idFieldController,
                                decoration: const InputDecoration(
                                    hintText: "이용자아이디",
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Color(0xffb8b8b8))),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23.79),
                Container(
                  width: 298,
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 298,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: Color(0xd87ac0eb),
                            width: 1.50,
                          ),
                          color: Color(0x00000000),
                        ),
                        padding: const EdgeInsets.only(
                          left: 21,
                          right: 163,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 94,
                              child: TextField(
                                onSubmitted: (value){print(value);},
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: _pwFieldController,
                                decoration: const InputDecoration(
                                    hintText: "비밀번호",
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Color(0xffb8b8b8))),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23.79),
                LoginButton(
                  idFieldController: _idFieldController,
                  pwFieldController: _pwFieldController,
                ),
                SizedBox(height: 23.79),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 18,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "아이디 찾기",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff4f4f4),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 18,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "비밀번호 찾기",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff4f4f4),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 18,
                      child: InkWell(
                        onTap: () {Get.to(()=>SignUpPage());},
                        child: Text(
                          "회원가입",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff4f4f4),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 123.79),
                SizedBox(
                  width: 70,
                  height: 18,
                  child: Text(
                    "간편 로그인",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                      color: Color(0xfff4f4f4),
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("images/google.png",width: 50,height: 50,),
                    Image.asset("images/kakao.png",width: 50,height: 50,),
                    Image.asset("images/naver.png",width: 50,height: 50,),
                    Image.asset("images/facebook.png",width: 50,height: 50,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
