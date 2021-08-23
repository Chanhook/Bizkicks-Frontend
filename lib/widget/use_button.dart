import 'package:flutter/cupertino.dart';

class UseButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
