import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:login/controller/kickboardUsageController.dart';
import 'package:login/screen/after_using_screen.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class KickboardUsageScreen extends StatefulWidget {
  const KickboardUsageScreen({Key key}) : super(key: key);

  @override
  _KickboardUsageScreenState createState() => _KickboardUsageScreenState();
}

class _KickboardUsageScreenState extends State<KickboardUsageScreen> {
  Completer<NaverMapController> _controller = Completer();
  Position position;
  var _loading = true;



  @override
  void initState() {
    super.initState();
    _onTapLocation();
    _loading = true;
    positionStream;
  }
  @override
  void dispose(){
    super.dispose();
    positionStream.cancel();
  }

  StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.best)
          .listen((Position position) {
    final KickboardUsageController c = Get.put(KickboardUsageController());
    print(position == null
        ? 'Unknown'
        : position.latitude.toString() + ', ' + position.longitude.toString());
    c.latitude.value = position.latitude.toDouble();
    c.longitude.value = position.longitude.toDouble();
    c.location_list
        .add([position.latitude.toDouble(), position.longitude.toDouble()]);
    c.coordinates
        .add(LatLng(position.latitude.toDouble(), position.longitude.toDouble()));
    c.cycle.value++;
  });


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

  //method

  /// 지도 생성 완료시
  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  } //컨트롤러가 종료가 되지 않아서 await에서 계속 기다리고 있었구나...!

  /// 지도 유형 선택시
  // void _onTapTypeSelector(MapType type) async {
  //   if (_mapType != type) {
  //     setState(() {
  //       _mapType = type;
  //     });
  //   }
  // }

  // my location button
  void _onTapLocation() async {
    final controller = await _controller.future;
    controller.setLocationTrackingMode(LocationTrackingMode.Follow);
  }

  void _onCameraChange(
      LatLng latLng, CameraChangeReason reason, bool isAnimated) {
    print('카메라 움직임 >>> 위치 : ${latLng.latitude}, ${latLng.longitude}'
        '\n원인: $reason'
        '\n에니메이션 여부: $isAnimated');
  }

  void _onCameraIdle() {
    print('카메라 움직임 멈춤');

    //_onTapLocation();
  }

  /// 지도 스냅샷
// void _onTapTakeSnapShot() async {
//   final controller = await _controller.future;
//   controller.takeSnapshot((path) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             content: path != null
//                 ? Image.file(
//               File(path),
//             )
//                 : Text('path is null!'),
//             titlePadding: EdgeInsets.zero,
//           );
//         });
//   });
}

class UseKickboardOverlay extends StatelessWidget {
  final KickboardUsageController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
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
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  c.stop();
                                  c.getDistance();
                                  c.arrive_time=DateTime.now();
                                  c.postHistory();
                                  Get.to(()=>AfterUsingScreen());

                                },
                                child: Text(
                                  "반납하기",
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
                        Image.asset("images/battery.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${c.battery.value}% 충전",
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
                        Icon(
                          Icons.timer,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${(c.timer.value / 60).toInt()}분 ${c.timer.value % 60}초 이용중",
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
                          "고장났어요",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff4246b0),
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            fontFamily: "IBM Plex Sans",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
