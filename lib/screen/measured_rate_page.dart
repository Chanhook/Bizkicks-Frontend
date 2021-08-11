import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screen/manager_page.dart';
import 'package:get/get.dart';

class MeasuredRatePage extends StatefulWidget {
  const MeasuredRatePage({Key key}) : super(key: key);

  @override
  _MeasuredRatePageState createState() => _MeasuredRatePageState();
}

class _MeasuredRatePageState extends State<MeasuredRatePage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  final List<int> _priceAlarm = <int>[];
  final List<int> _timeAlarm = <int>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('종량제모델'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('설명'),
                    content: Column(
                      children: <Widget>[Text("종량제 모델 설명 ~~")],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('알림설정'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('금액알림'),
                            InkWell(
                                onTap: () {
                                  _displayDialog(context);
                                },
                                child: Icon(Icons.add)),
                          ],
                        ),
                        if (_priceAlarm.length != 0)
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: _priceAlarm.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 30,
                                  child: ListTile(
                                    title: Text('${_priceAlarm[index]}원'),
                                    trailing: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _priceAlarm.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.delete)),
                                  ),
                                );
                              }),
                        Divider(
                          color: Colors.black45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('시간알림'),
                            InkWell(
                                onTap: () {
                                  _displayDialog2(context);
                                },
                                child: Icon(Icons.add)),
                          ],
                        ),
                        if (_timeAlarm.length != 0)
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: _timeAlarm.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 30,
                                  child: ListTile(
                                    title: Text('${_timeAlarm[index]}시간'),
                                    trailing: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _timeAlarm.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.delete)),
                                  ),
                                );
                              }),
                        Divider(
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('계약'),
                    content: Container(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            '계약서~계약서~계약서~계약서~계약서~\n' +
                                '계약서~계약서~계약서~계약서~계약서~\n' +
                                '계약서~계약서~계약서~계약서~계약서~\n' +
                                '계약서~계약서~계약서~계약서~계약서~\n' +
                                '계약서~계약서~계약서~계약서~계약서~\n' +
                                '계약서~계약서~계약서~계약서~계약서~',
                          ),
                        ),
                      ),
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),Step(
                    title: new Text('계약 완료'),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("계약 완료!",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(child: Text("이용 기한"))),
                                Expanded(child: Center(child: Text("7월 17일 ~ 8월 17일")),),
                              ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text(
                            "직원들을 초대해 주세요\n"
                                "법인 코드 : abcde\n"
                        ),
                        ElevatedButton(onPressed: (){Get.offAll(ManagerPage());}, child: Text("계약목록으로"))

                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),
    );
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('알림을 받을 금액을 입력하세요.'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: '숫자만 입력하세요'),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addAlarmPrice(_textFieldController.text);
                },
              ),
              // cancel button
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<AlertDialog> _displayDialog2(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('알림을 받을 시간을입력하세요.'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: '숫자만 입력하세요'),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addAlarmTime(_textFieldController.text);
                },
              ),
              // cancel button
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void _addAlarmPrice(String price) {
    setState(() {
      _priceAlarm.add(int.parse(price));
    });
    _textFieldController.clear();
  }

  void _addAlarmTime(String time) {
    setState(() {
      _timeAlarm.add(int.parse(time));
    });
    _textFieldController.clear();
  }
}

