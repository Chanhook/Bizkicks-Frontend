import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/model/kickboard.dart';
import 'package:login/widget/search_box.dart';
import 'package:login/widget/useKickboardOverlay.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

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
  LatLng _latLng;
  var _detailed = false;
  var map = {'씽씽': 'Xingxing.png', '라임': 'Lime.png', '킥고잉': 'Kickgoing.png'};

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'icon/logo.png',
        context: context,
      ).then((image) {
        setState(() {
          _markers.add(Marker(
              markerId: 'id',
              position: LatLng(37.563600, 126.962370),
              captionText: "커스텀 아이콘",
              captionColor: Colors.indigo,
              captionTextSize: 20.0,
              alpha: 0.8,
              icon: image,
              anchor: AnchorPoint(0.5, 1),
              width: 45,
              height: 45,
              infoWindow: '인포 윈도우',
              onMarkerTab: _onMarkerTap));
        });
      });
    });
    super.initState();
    _get();
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
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
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              _controlPanel(),
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
                  SizedBox(height: 430,),
                  UseKickboardOverlay(),

                ],
              ),
            ],
          ),

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
              zoom: 15,
            ),
            onMapCreated: _onMapCreated,
            onCameraChange: _onCameraChange,
            onMapTap: _onMapTap,
            markers: _markers,
            initLocationTrackingMode: LocationTrackingMode.Follow,
            locationButtonEnable: true,
          ),
        ],
      ),
    );
  }

  // ================== method ==========================
  void _get() async {
    String url = "http://13.125.192.78:8080/kickboard/location";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    var responseBody = utf8.decode(response.bodyBytes);
    /*
    print("statusCode: ${statusCode}");
    print("responseHeaders: ${responseHeaders}");
    print("responseBody: ${responseBody}");
    */
    List list = jsonDecode(responseBody);

    for (var i in list) {
      var kickboard = Kickboard.fromJson(i);
      print(kickboard.company_name);
      _markerCreated(kickboard);
      var img = map[kickboard.company_name];
    }
    print(_markers);
  }

  void _onCameraChange(
      LatLng latLng, CameraChangeReason reason, bool isAnimated) {
    setState(() {
      _latLng = latLng;
      _detailed = false;
    });
  }

  Future<void> _markerCreated(Kickboard kickboard) async {
    var img = map[kickboard.company_name];
    _markers.add(Marker(
        markerId: DateTime.now().toIso8601String(),
        position: LatLng(kickboard.lat, kickboard.lng),
        alpha: 0.8,
        icon: await OverlayImage.fromAssetImage(
            assetName: 'images/${img}', context: context),
        anchor: AnchorPoint(0.5, 1),
        width: 45,
        height: 45,
        onMarkerTab: _onMarkerTap));
    print(_markers);
    print(_markers.length);
  }

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
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
      _markers[pos].captionText = '선택됨';
      print(_markers[pos]);
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
