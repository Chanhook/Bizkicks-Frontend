import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindId extends StatefulWidget {
  @override
  _FindIdState createState() => _FindIdState();
}

class _FindIdState extends State<FindId> {
  final TextEditingController emailFieldController =
      new TextEditingController();
  var _email = "";
  var _hasDone=false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xb54f32c3), Color(0xff1a2e99)],
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                    width: 50,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ))),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                "아이디 찾기",
                style: TextStyle(color: Colors.white),
              ))),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 299,
            height: 50,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: Color(0xffcccccc),
                          width: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 298,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 26,
                  child: SizedBox(
                    width: 199,
                    height: 18,
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          _email = value;
                          _hasDone=true;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      controller: emailFieldController,
                      decoration: const InputDecoration(
                        hintText: "이메일을 입력해 주세요",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xffb5b5b5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          (_hasDone)?SizedBox(
            width: 340,
            height: 46,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                // elevation: MaterialStateProperty.all(3),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Container(
                width: 322,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color(0xb282e3f8),
                ),
                child: Center(
                    child: Text(
                  "아이디 찾기",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
              onPressed: () {
                print(_email);
              },
            ),
          ):Container(),
        ]),
      ),
    );
  }
}
