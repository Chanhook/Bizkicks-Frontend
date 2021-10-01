import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/controller/kickboardUsageHistoryController.dart';
import 'package:login/controller/tokenController.dart';
import 'package:login/screen/after_using_screen.dart';
import 'package:login/screen/find_id_screen.dart';
import 'package:login/screen/find_password_page.dart';
import 'package:login/screen/kickboard_usage_screen.dart';
import 'package:login/screen/manager_page.dart';
import 'package:login/screen/sign_up_page.dart';
import 'package:login/urls/url.dart';
import 'package:login/widget/LoginButton.dart';
import 'package:login/widget/marker_map_page.dart';
import 'package:http/http.dart' as http;

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

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController _idFieldController = TextEditingController();

  final TextEditingController _pwFieldController = TextEditingController();

  bool _loading = false;

  final TokenController tc = Get.put(TokenController());

  Future<bool> _login() async {
    var url = loginUrl;
    final msg = jsonEncode(
        {"id": _idFieldController.text, "password": _pwFieldController.text});
    final response = await http.post(Uri.parse(url), body: msg, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      tc.grantType = result["grantType"];
      tc.accessToken = result["accessToken"];
      tc.accessTokenExpiresIn = result["accessTokenExpiresIn"];
      tc.refreshToken = result["refreshToken"];

      print(tc.grantType);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

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
                                onSubmitted: (value) {
                                  print(value);
                                },
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
                                onSubmitted: (value) {
                                  print(value);
                                },
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
                !_loading
                    ? Material(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white.withOpacity(0.0),
                        child: InkWell(
                          onTap: () async {
                            print(_idFieldController.text);
                            print(_pwFieldController.text);
                            setState(() {
                              _loading = true;
                            });
                            var isLogin = await _login();
                            setState(() {
                              _loading = false;
                            });
                            if (isLogin) Get.off(() => MarkerMapPage());
                          },
                          child: Container(
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
                                    color: Color(0xb282e3f8),
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 108,
                                    right: 109,
                                    top: 15,
                                    bottom: 14,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 81,
                                        child: Text(
                                          "로그인",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.ibmPlexSans(
                                            color: Color(0xfff4f4f4),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
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
                        onTap: () {
                          Get.to(() => FindId());
                        },
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
                        onTap: () {
                          Get.to(()=>FindPw());
                        },
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
                        onTap: () {
                          Get.to(() => SignUpPage());
                        },
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/google.png",
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      "images/kakao.png",
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      "images/naver.png",
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      "images/facebook.png",
                      width: 50,
                      height: 50,
                    ),
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

