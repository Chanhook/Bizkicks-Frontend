import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        }
    );
  }
}

  class NewLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Container(),
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
  await Future.delayed(Duration(seconds: 3));
  }
  }