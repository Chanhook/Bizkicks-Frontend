import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 45,
              child: FloatingActionButton(
                  child: Icon(Icons.view_list,color:Color(0xff4a50b3),size: 20,),
                  onPressed: () {},
                  backgroundColor: Colors.white,
              )),
          Container(
            width: 123,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 12,
                  offset: Offset(4, 4),
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(
              left: 8,
              right: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: Icon(
                                      Icons.search,
                                      color: Color(0xff4a50b3),
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
                SizedBox(width: 2),
                SizedBox(
                  width: 79,
                  height: 13,
                  child: Text(
                    "다른 장소 검색",
                    style: TextStyle(
                      color: Color(0xff4a50b3),
                      fontSize: 12,
                      fontFamily: "IBM Plex Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 45,
          ),
        ],
      ),
    );
  }
}
