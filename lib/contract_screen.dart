import 'package:flutter/material.dart';

class Contract extends StatelessWidget {
  const Contract({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Center(
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
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("정액제"),
                color: Colors.yellowAccent,
                width: 250,
                height: 250,
              ),
            ),
          ),
        )
      ],
    );
  }
}
