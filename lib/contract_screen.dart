import 'package:flutter/material.dart';
import 'package:login/screen/measured_rate_page.dart';

class Contract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
              builder: (context)=>MeasuredRatePage()
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("종량제"),
                color: Colors.lightGreen,
                width: 250,
                height: 250,
              ),
            ),
          ),
          InkWell(
            onTap:(){},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("정액제"),
                color: Colors.yellow,
                width: 250,
                height: 250,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
