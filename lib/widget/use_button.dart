import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screen/kickboard_usage_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class UseButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Get.to(()=>QRViewExample());},
      child: Container(
        width: 147,
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
          gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xff25349f), Color(0xff826ed5), Color(0xff826ed5)], ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 15, ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text(
              " 이용하기",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfff4f4f4),
                fontSize: 15,
                fontFamily: "IBM Plex Sans",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (GetPlatform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Announcement(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0x2d000000),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "ID 직접입력",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.04,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2,),
                      Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0x2d000000),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "손전등 켜기",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.04,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (result != null)
                    // if qrcode is recognized
                    //later will be changed Get.to
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                            onPressed: () async {
                              Get.off(()=>KickboardUsageScreen());
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data)}');
                                } else {
                                  return Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      // You can choose between CameraFacing.front or CameraFacing.back. Defaults to CameraFacing.back
      // cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      // Choose formats you want to scan. Defaults to all formats.
      // formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class Announcement extends StatelessWidget {
  const Announcement({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286,
      height: 27,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            width: 286,
            height: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0x7f8c8c8c),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(
                  width: 286,
                  height: 27,
                  child: Center(
                    child: Text(
                      "킥보드의 QR 코드를 찍어주세요.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 0.78,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




