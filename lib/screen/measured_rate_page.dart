import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeasuredRatePage extends StatefulWidget {
  const MeasuredRatePage({Key? key}) : super(key: key);

  @override
  _MeasuredRatePageState createState() => _MeasuredRatePageState();
}

class _MeasuredRatePageState extends State<MeasuredRatePage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

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
                            InkWell(onTap: () {

                            }, child: Icon(Icons.add)),
                          ],
                        ),
                        Divider(
                          color: Colors.black45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('시간알림'),
                            Icon(Icons.add),
                          ],
                        ),
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
                    title: new Text('Mobile Number'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
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

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
