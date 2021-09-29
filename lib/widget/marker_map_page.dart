import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/controller/tokenController.dart';
import 'package:login/controller/userController.dart';
import 'package:login/model/error.dart';
import 'package:login/model/kickboard.dart';
import 'package:login/screen/manager_page.dart';
import 'package:login/urls/url.dart';
import 'package:login/widget/search_box.dart';
import 'package:login/widget/useKickboardOverlay.dart';
import 'package:login/widget/use_button.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../main.dart';
import 'detailScreen.dart';

class MarkerMapPage extends StatefulWidget {
  @override
  _MarkerMapPageState createState() => _MarkerMapPageState();
}

class _MarkerMapPageState extends State<MarkerMapPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const MODE_ADD = 0xF1;
  static const MODE_REMOVE = 0xF2;
  static const MODE_NONE = 0xF3;
  int _currentMode = MODE_NONE;
  var _detailed = false;
  var map = {'씽씽': 'Xingxing.png', '라임': 'Lime.png', '킥고잉': 'Kickgoing.png'};

  List<Kickboard> kickboardList = [];
  var _brand="";
  var _image = "";
  var _model = "";
  var _battery = 0;

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("권한 없음"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "관리자 전용 페이지 입니다.",
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    final UserController uc=Get.put(UserController());
    final TokenController tc=Get.put(TokenController());
    // 마커 생성
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   OverlayImage.fromAssetImage(
    //     assetName: 'icon/logo.png',
    //     context: context,
    //   ).then((image) {
    //     setState(() {
    //       _markers.add(Marker(
    //           markerId: 'id',
    //           position: LatLng(37.563600, 126.962370),
    //           captionText: "커스텀 아이콘",
    //           captionColor: Colors.indigo,
    //           captionTextSize: 20.0,
    //           alpha: 0.8,
    //           icon: image,
    //           anchor: AnchorPoint(0.5, 1),
    //           width: 45,
    //           height: 45,
    //           infoWindow: '인포 윈도우',
    //           onMarkerTab: _onMarkerTap));
    //     });
    //   });
    // });
    super.initState();
    _onTapLocation();
    _get();

    uc.accessToken=tc.accessToken;
    uc.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final TokenController tc=Get.put(TokenController());
    final UserController uc=Get.put(UserController());


    //_markerCreated();       //컨트롤 바의 상태가 바뀌면서 재 빌드가 된거임!!!
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 42.98,
                    child: FlutterLogo(size: 42.981502532958984),
                  ),
                  SizedBox(
                    width: 162,
                    child: Text(
                      "SWM 김찬혁님,\n안녕하세요.",
                      style: TextStyle(
                        color: Color(0xff0d0d0d),
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            )),
            Divider(
              thickness: 4,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "이용내역",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "이용방법",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "안전교육",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                Get.offAll(NewLoginPage());
              },
              title: Text(
                "로그아웃",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "설정",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                uc.user_role=="ROLE_MANAGER"?Get.to(() => ManagerPage()):FlutterDialog();
              },
              title: Text(
                "관리자페이지",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              //_controlPanel(),
              _naverMap(),
            ],
          ),
          //if (_detailed) UseKickboardOverlay(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Remove(scaffoldKey: _scaffoldKey),
              Column(
                children: [
                  SearchBox(scaffoldKey: _scaffoldKey),
                  SizedBox(
                    height: 430,
                  ),
                  if (_detailed)
                    UseKickboardOverlay(
                        brand:_brand, image: _image, model: _model, battery: _battery),
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
                          onPressed: () {},
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: Color(0xff4246b0),
                          )),
                    ),
                    SizedBox(
                      height: 40,
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
        ]),
      ),
    );
  }

  _controlPanel() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 추가
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentMode = MODE_ADD),
              child: Container(
                decoration: BoxDecoration(
                    color:
                        _currentMode == MODE_ADD ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '추가',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        _currentMode == MODE_ADD ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // 삭제
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentMode = MODE_REMOVE),
              child: Container(
                decoration: BoxDecoration(
                    color: _currentMode == MODE_REMOVE
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '삭제',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentMode == MODE_REMOVE
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // none
          GestureDetector(
            onTap: () => setState(() => _currentMode = MODE_NONE),
            child: Container(
              decoration: BoxDecoration(
                  color:
                      _currentMode == MODE_NONE ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black)),
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.clear,
                color: _currentMode == MODE_NONE ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
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
              zoom: 16,
            ),
            onMapCreated: onMapCreated,
            onCameraChange: _onCameraChange,
            onMapTap: _onMapTap,
            markers: _markers,
            initLocationTrackingMode: LocationTrackingMode.Follow,
            locationButtonEnable: false,
          ),
        ],
      ),
    );
  }

  // ================== method ==========================
  void _get() async {
    String url = kickboardsLocationUrl;
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    var responseBody = utf8.decode(response.bodyBytes);

    // print("statusCode: ${statusCode}");
    // print("responseHeaders: ${responseHeaders}");
    // print("responseBody: ${responseBody}");
    // print("-----");
    if (statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(responseBody);

      for (var i in result["list"]) {
        var kickboard = Kickboard.fromJson(i);
        kickboardList.add(kickboard);
        print(kickboard.company_name);
        _markerCreated(kickboard);
      }
    } else {
      var result = Error.fromJson(jsonDecode(responseBody));
      print("킥보드위치 안뜰때:");
      print(result.timestamp);
      print(result.status);
      print(result.error);
      print(result.code);
      print(result.msg);
    }
  }

  void _onCameraChange(
      LatLng latLng, CameraChangeReason reason, bool isAnimated) {
    setState(() {
      _detailed = false;
    });
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

  Future<void> _markerCreated(Kickboard kickboard) async {
    var img = map[kickboard.company_name];
    _markers.add(Marker(
        markerId: DateTime.now().toIso8601String() + kickboard.company_name,
        position: LatLng(kickboard.lat, kickboard.lng),
        alpha: 0.8,
        icon: await OverlayImage.fromAssetImage(
            assetName: 'images/${img}', context: context),
        anchor: AnchorPoint(0.5, 1),
        width: 45,
        height: 45,
        onMarkerTab: _onMarkerTap));
  }

  Future<void> _onMapTap(LatLng latLng) async {
    if (_currentMode == MODE_ADD) {
      _markers.add(Marker(
        markerId: DateTime.now().toIso8601String(),
        position: latLng,
        icon: await OverlayImage.fromAssetImage(
            assetName: 'icon/marker.png', context: context),
        infoWindow: '테스트',
        onMarkerTab: _onMarkerTap,
      ));
      setState(() {});
      print(_markers);
    }
  }

  void _onMarkerTap(Marker marker, Map<String, int> iconSize) {
    int pos = _markers.indexWhere((m) => m.markerId == marker.markerId);
    setState(() {
      print(_markers[pos]);
      _image = "images/${map[_markers[pos].markerId.substring(26)]}";
      print(_image);
      _model = kickboardList[pos].model;
      _battery = kickboardList[pos].battery;
      _brand=kickboardList[pos].company_name;
      print(_model);
      print(_battery);
      _detailed = true;
    });
    if (_currentMode == MODE_REMOVE) {
      setState(() {
        _markers.removeWhere((m) => m.markerId == marker.markerId);
      });
    }
  }
}

class Remove extends StatelessWidget {
  const Remove({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
        icon: Icon(Icons.menu));
  }
}
