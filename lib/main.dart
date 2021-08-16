import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen/login_page.dart';

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
              home: NewLoginPage(),
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
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xb54f32c3), Color(0xff1a2e99)], ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height: 200,),
                Center(child: Image.asset('images/logo.png',
                width: 200,)),
                SizedBox(height: 50,),
                Container(
                  width: 298,
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        width: 298,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(color: Color(0xd87ac0eb), width: 1.50, ),
                          color: Color(0x00000000),
                        ),
                        padding: const EdgeInsets.only(left: 21, right: 163, ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            SizedBox(
                              width: 94,
                              child: TextField(
                                controller: _textFieldController,
                                decoration: const InputDecoration(hintText: "이용자아이디",
                                hintStyle: TextStyle(color: Color(0xffb8b8b8))),
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
                    children:[
                      Container(
                        width: 298,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(color: Color(0xd87ac0eb), width: 1.50, ),
                          color: Color(0x00000000),
                        ),
                        padding: const EdgeInsets.only(left: 21, right: 163, ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            SizedBox(
                              width: 94,
                              child: TextField(
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: _textFieldController,
                                decoration: const InputDecoration(hintText: "비밀번호",
                                    hintStyle: TextStyle(color: Color(0xffb8b8b8))),
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
                LoginButton(),
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
                        onTap: (){},
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
                        onTap: (){},
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
                        onTap: (){},
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
                SizedBox(height: 23.79),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(80),
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 298,
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                width: 298,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color(0xb282e3f8),
                ),
                padding: const EdgeInsets.only(left: 108, right: 109, top: 15, bottom: 14, ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
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
    );
  }
}
