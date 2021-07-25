import 'package:flutter/material.dart';

class termsConditionsPage extends StatefulWidget {
  final String title;
  termsConditionsPage({Key? key, required String this.title}) : super(key: key);

  @override
  _termsConditionsPageState createState() => _termsConditionsPageState();
}

class _termsConditionsPageState extends State<termsConditionsPage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
              children: <Widget>[
                Container(
                  child: Text("제1조(목적) 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 제2조(정의) 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 제3조(~~) 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 제4조(~~) 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 제5조(~~) 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 제6조(~~) 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~ 약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~약관내용~"),
                ),
                Container(
                  child: InkWell(
                    onTap: (){
                      if(!_checked){
                        _checked=true;
                      }else{
                        _checked=false;
                      }
                      setState(() {
                        _checked=this._checked;
                      });
                      Navigator.pop(context,true);
                    },
                    child: Row(
                      children: <Widget>[
                        _checked?Icon(Icons.radio_button_checked):Icon(Icons.radio_button_unchecked),
                        Text("해당 약관에 동의합니다.")
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
