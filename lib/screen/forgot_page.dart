import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _items = ["아이디 찾기", "비밀번호 찾기"];
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_items[_index]}"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 200, 0),
            child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: '아이디찾기',
                          ),
                          Tab(
                            text: '비밀번호 찾기',
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '가입한 전화번호',
                  hintText: '01012345678'),
            ),
          ),
          Container(
            height: 50,
            width: 410,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                '아이디 찾기',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("가입된 아이디가 있을 경우, 가입 시 입력하신 전화번호로 아이디를 안내해 드립니다."),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("만약 문자메시지가 오지 않는다면 스팸 편지함으로 이동하지 않았는지 확인해 주세요."),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("문자메시지 서비스 제공자 사정에 의해 즉시 도착하지 않을 수 있으니 최대 30분 정도 기다리신 후 다시 시도해 주세요."),
              )
            ],
          ),
        ],
      ),
    );
  }
}
