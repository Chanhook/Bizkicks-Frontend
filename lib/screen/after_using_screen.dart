import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/kickboardUsageController.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class AfterUsingScreen extends StatefulWidget {
  @override
  _AfterUsingScreenState createState() => _AfterUsingScreenState();
}

class _AfterUsingScreenState extends State<AfterUsingScreen> {
  Completer<NaverMapController> _controller = Completer();
  final KickboardUsageController c = Get.put(KickboardUsageController());
  List<LatLng> coordinates=[];

  @override
  void initState(){
    super.initState();
    getCoordinates();
  }
  void getCoordinates(){
    c.coordinates.forEach((element) {coordinates.add(element);});
  }

  @override
  Widget build(BuildContext context) {
    final KickboardUsageController c = Get.put(KickboardUsageController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _naverMap(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Remove(scaffoldKey: _scaffoldKey),
                Column(
                  children: [
                    SizedBox(
                      height: Get.height - 350,
                    ),
                    UseKickboardOverlay(),
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 40,
                  height: 40,
                  child: Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Color(0x7fb7b7b7),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              _onTapLocation();
                              print(1);
                              c.getLocation();
                            },
                            icon: Icon(Icons.location_on_rounded,color: Color(0xff4246b0),)),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _naverMap() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          NaverMap(
            pathOverlays: {
              PathOverlay(
                PathOverlayId('path'),
                coordinates,
                width: 10,
                color: Colors.red,
                outlineColor: Colors.white,
              )
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(37.55326969115973, 126.97238587375881),
              zoom: 15,
            ),
            initLocationTrackingMode: LocationTrackingMode.Follow,
            locationButtonEnable: false,
            onMapCreated: onMapCreated,
            //onCameraIdle: _onCameraIdle,
          ),
        ],
      ),
    );
  }

  /// 지도 생성 완료시
  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
  void _onTapLocation() async {
    final controller = await _controller.future;
    controller.setLocationTrackingMode(LocationTrackingMode.Follow);
  }
}

class UseKickboardOverlay extends StatelessWidget {
  final KickboardUsageController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 339,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Color(0xfff9f9f9),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x2d000000),
                            blurRadius: 10,
                            offset: Offset(1, 5),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff25349f),
                            Color(0xff826ed5),
                            Color(0xff826ed5)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 44,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              c.stop();
                            },
                            child: Text(
                              "반납 완료하기",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xfff4f4f4),
                                fontSize: 15,
                                fontFamily: "IBM Plex Sans",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: 30,
            child: Column(
              children: [
                Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xfff9f9f9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      "images/Xingxing.png",
                    )),
              ],
            )),
        Positioned(
          top: 50,
          left: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AAAAA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffb0b0b0),
                  fontSize: 14,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      "이용시간    ${(c.timer.value / 60).toInt()}분 ${c.timer.value % 60}초",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      "이동거리    ${c.distanceInMeters.toInt()}m",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 250,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 83,
                    child: Text(
                      "사진 재촬영",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff4246b0),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
