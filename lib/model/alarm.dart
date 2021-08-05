// To parse this JSON data, do
//
//     final alarm = alarmFromJson(jsonString);

import 'dart:convert';

Alarm alarmFromJson(String str) => Alarm.fromJson(json.decode(str));

String alarmToJson(Alarm data) => json.encode(data.toJson());

class Alarm {
  Alarm({
    this.list,
  });

  List<ListElement> list;

  factory Alarm.fromJson(Map<String, dynamic> json) => Alarm(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.type,
    this.value,
  });

  String type;
  int value;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value,
  };
}
