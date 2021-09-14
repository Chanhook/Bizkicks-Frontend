import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/kickboardUsageController.dart';
import 'package:login/widget/marker_map_page.dart';
import 'package:login/widget/starRating.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AfterUsingScreen extends StatefulWidget {
  @override
  _AfterUsingScreenState createState() => _AfterUsingScreenState();
}

class _AfterUsingScreenState extends State<AfterUsingScreen> {
  Completer<NaverMapController> _controller = Completer();
  final KickboardUsageController c = Get.put(KickboardUsageController());
  List<LatLng> coordinates = [];

  @override
  void initState() {
    super.initState();
    getCoordinates();
    print("좌표 개수: ${coordinates.length}");
  }

  void getCoordinates() {
    c.coordinates.forEach((element) {
      coordinates.add(element);
    });
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height - 350,
                      ),
                      UseKickboardOverlay(),
                    ],
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 40,
                  height: 160,
                  child: Column(
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
                            },
                            icon: Icon(
                              Icons.add,
                              color: Color(0xff4246b0),
                            )),
                      ),
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
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Color(0xff4246b0),
                            )),
                      ),
                      SizedBox(height: 40,),
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
                            },
                            icon: Icon(
                              Icons.location_on_rounded,
                              color: Color(0xff4246b0),
                            )),
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
          if (coordinates.length > 1)
            NaverMap(
              pathOverlays: {
                PathOverlay(
                  PathOverlayId('path'),
                  coordinates,
                  width: 10,
                  color: Color(0xff6d61c9),
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
          if (coordinates.length <= 1)
            NaverMap(
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

class UseKickboardOverlay extends StatefulWidget {
  @override
  _UseKickboardOverlayState createState() => _UseKickboardOverlayState();
}

class _UseKickboardOverlayState extends State<UseKickboardOverlay> {
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
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return LeaveReview();
                                  });
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
                      "${c.image.value}",
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
                "${c.model.value}",
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

class LeaveReview extends StatefulWidget {
  @override
  _LeaveReviewState createState() => _LeaveReviewState();
}

class _LeaveReviewState extends State<LeaveReview> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("운행이 만족스러우셨나요?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: "IBM Plex Sans",
            fontWeight: FontWeight.w700,
          )),
      content: Container(
        height: 200,
        child: Column(
          children: [
            Test(),
            SizedBox(
              height: 30,
            ),
            TextField(
              maxLines: 4,
              controller: _textFieldController,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '당신의 경험을 공유해 주세요.(선택)'),
            )
          ],
        ),
      ),
      actions: <Widget>[
        //다음에 할래요
        Container(
          width: 154,
          height: 57,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 154,
                height: 57,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 154,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x282c2738),
                            blurRadius: 48,
                            offset: Offset(0, 24),
                          ),
                          BoxShadow(
                            color: Color(0x142c2738),
                            blurRadius: 24,
                            offset: Offset(0, 12),
                          ),
                        ],
                        color: Color(0xffbbbbbb),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.offAll(() => MarkerMapPage());
                              Get.delete<KickboardUsageController>();
                            },
                            child: SizedBox(
                              width: 154,
                              child: Text(
                                "다음에 할래요",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffeaf4f8),
                                  fontSize: 24,
                                  fontFamily: "IBM Plex Sans",
                                  fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
        //제출하기
        Container(
          width: 154,
          height: 57,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 154,
                height: 57,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 154,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x282c2738),
                            blurRadius: 48,
                            offset: Offset(0, 24),
                          ),
                          BoxShadow(
                            color: Color(0x142c2738),
                            blurRadius: 24,
                            offset: Offset(0, 12),
                          ),
                        ],
                        color: Color(0xffb63927),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.offAll(() => MarkerMapPage());
                              Get.delete<KickboardUsageController>();
                            },
                            child: SizedBox(
                              width: 154,
                              child: Text(
                                "제출하기",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffeaf4f8),
                                  fontSize: 24,
                                  fontFamily: "IBM Plex Sans",
                                  fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ],
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return new StarRating(
      rating: rating,
      onRatingChanged: (rating) => setState(() => this.rating = rating),
    );
  }
}
