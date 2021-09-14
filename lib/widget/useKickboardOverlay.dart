import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/widget/use_button.dart';

import 'detailScreen.dart';

class UseKickboardOverlay extends StatelessWidget {
  const UseKickboardOverlay({
    Key key,
    @required String image,
    @required String model,
    @required int battery,
  }) : _image = image, _model = model, _battery = battery, super(key: key);

  final String _image;
  final String _model;
  final int _battery;

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
                  UseButton(image: _image,model: _model,battery: _battery,),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: 0,
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
                      "${_image}",
                    )),
                Text(
                  "${_model}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffb0b0b0),
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Text(
                    "${_battery}% 충전",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "IBM Plex Sans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )),
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
                  GestureDetector(
                    onTap: (){Get.to(()=>DetailScreen());},
                    child: Hero(
                      tag: 'kickboard',
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/afterUsingKickboard.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 83,
                    child: Text(
                      "여기 없어요",
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
    );
  }
}
