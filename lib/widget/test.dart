import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

class Iphone11prox54Widget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final _height=MediaQuery.of(context).size.height;

    final _width=MediaQuery.of(context).size.width;
    // Figma Flutter Generator Iphone11prox54Widget - FRAME
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: 812,
        color: Colors.white,
        child: Stack(
          children:[
            Container(
              width: width,
              height: 812,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xb54f32c3), Color(0xe0ffffff)], ),
              ),
              padding: const EdgeInsets.only(bottom: 148, ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Container(
                    width: width,
                    height: 88,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: width,
                          height: 88,
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 146, right: 146, top: 56, bottom: 10, ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:[
                              SizedBox(
                                width: 85,
                                child: Text(
                                  "계약 목록",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff3e44ae),
                                    fontSize: 17,
                                    fontFamily: "IBM Plex Sans",
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
                  SizedBox(height: 255),
                  Text(
                    "계약목록이 없습니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff969696),
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 200),
                  Container(
                    width: 298,
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 298,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 5,
                                offset: Offset(1, 5),
                              ),
                            ],
                            gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xff25349f), Color(0xff826ed5), Color(0xff826ed5)], ),
                          ),
                          padding: const EdgeInsets.only(top: 14, bottom: 15, ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              SizedBox(
                                width: 114,
                                child: Text(
                                  "계약하러 가기",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xfff4f4f4),
                                    fontSize: 16,
                                    fontFamily: "IBM Plex Sans",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  /*
                  Container(
                    width: 298,
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 298,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 5,
                                offset: Offset(1, 5),
                              ),
                            ],
                            gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xff25349f), Color(0xff826ed5), Color(0xff826ed5)], ),
                          ),
                          padding: const EdgeInsets.only(top: 14, bottom: 15, ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              SizedBox(
                                width: 114,
                                child: Text(
                                  "계약하러 가기",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xfff4f4f4),
                                    fontSize: 16,
                                    fontFamily: "IBM Plex Sans",
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
                  */
                ],
              ),
            ),
            /*
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 376,
                  height: 643,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0xe0ffffff),
                  ),
                ),
              ),
            ),
            */
            /*
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 376,
                  height: 83,
                  child: Stack(
                    children:[Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: width,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 34),
                        ),
                      ),
                    ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: width,
                            height: 83,
                            color: Colors.white,
                            padding: const EdgeInsets.only(left: 30, right: 28, top: 8, bottom: 33, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Container(
                                  width: 30,
                                  height: 40.33,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[
                                      Transform.rotate(
                                        angle: 3.14,
                                        child: Container(
                                          width: 20,
                                          height: 23.33,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color(0xff4a50b3),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2912),
                                      Text(
                                        "계약목록",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff4a50b3),
                                          fontSize: 8,
                                          fontFamily: "Noto Sans KR",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 63.33),
                                Container(
                                  width: 30,
                                  height: 40,
                                  child: Stack(
                                    children:[Text(
                                      "계약하기",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 8,
                                        fontFamily: "Noto Sans KR",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),],
                                  ),
                                ),
                                SizedBox(width: 63.33),
                                Container(
                                  width: 30,
                                  height: 40.21,
                                  child: Stack(
                                    children:[Text(
                                      "대시보드",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 8,
                                        fontFamily: "Noto Sans KR",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),],
                                  ),
                                ),
                                SizedBox(width: 63.33),
                                Container(
                                  width: 37,
                                  height: 42,
                                  child: Stack(
                                    children:[Container(
                                      width: 37,
                                      height: 42,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:[
                                          Container(
                                            width: 27,
                                            height: 27,
                                            padding: const EdgeInsets.only(left: 4, right: 23, top: 2, bottom: 25, ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[

                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            "마이페이지",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 8,
                                              fontFamily: "Noto Sans KR",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),],
                  ),
                ),
              ),
            ),
            */
            Container(
              width: _width,
              height: 83,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: _width,
                        height: 83,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                          left: 22,
                          right: 22,
                          top: 8,
                          bottom: 33,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 45,
                              height: 40.33,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: 3.14,
                                    child: Container(
                                      width: 20,
                                      height: 23.33,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff4a50b3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "계약목록",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff4a50b3),
                                      fontSize: 8,
                                      fontFamily: "Noto Sans KR",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 60.33),
                            Container(
                              width: 45,
                              height: 40.33,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: 3.14,
                                    child: Container(
                                      width: 20,
                                      height: 23.33,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff4a50b3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "계약하기",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff4a50b3),
                                      fontSize: 8,
                                      fontFamily: "Noto Sans KR",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 60.33),
                            Container(
                              width: 45,
                              height: 40.33,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: 3.14,
                                    child: Container(
                                      width: 20,
                                      height: 23.33,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff4a50b3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "대시보드",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff4a50b3),
                                      fontSize: 8,
                                      fontFamily: "Noto Sans KR",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 60.33),
                            Container(
                              width: 45,
                              height: 40.33,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: 3.14,
                                    child: Container(
                                      width: 20,
                                      height: 23.33,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff4a50b3),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "마이페이지",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff4a50b3),
                                      fontSize: 8,
                                      fontFamily: "Noto Sans KR",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      );
  }
}
