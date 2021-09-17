
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/widget/marker_map_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    this.idFieldController,
    this.pwFieldController,
  }) : super(key: key);
  final TextEditingController idFieldController;
  final TextEditingController pwFieldController;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(80),
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        onTap: () {
          print(idFieldController.text);
          print(pwFieldController.text);

          Get.off(()=>MarkerMapPage());

        },
        child: Container(
          width: 298,
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 298,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color(0xb282e3f8),
                ),
                padding: const EdgeInsets.only(
                  left: 108,
                  right: 109,
                  top: 15,
                  bottom: 14,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 81,
                      child: Text(
                        "로그인",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          color: Color(0xfff4f4f4),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
