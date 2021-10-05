// To parse this JSON data, do
//
//     final checkContractPlan = checkContractPlanFromJson(jsonString);

import 'dart:convert';

CheckContractPlan checkContractPlanFromJson(String str) => CheckContractPlan.fromJson(json.decode(str));

String checkContractPlanToJson(CheckContractPlan data) => json.encode(data.toJson());

class CheckContractPlan {
  CheckContractPlan({
    this.type,
    this.startdate,
    this.list,
  });

  String type;
  DateTime startdate;
  List<ListElement> list;

  factory CheckContractPlan.fromJson(Map<String, dynamic> json) => CheckContractPlan(
    type: json["type"],
    startdate: DateTime.parse(json["startdate"]),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "startdate": "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.companyName,
    this.pricePerHour,
    this.totalTime,
    this.districts,
    this.insurance,
    this.helmet,
    this.usedTime,
  });

  String companyName;
  int pricePerHour;
  int totalTime;
  List<dynamic> districts;
  bool insurance;
  bool helmet;
  int usedTime;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    companyName: json["company_name"],
    pricePerHour: json["price_per_hour"],
    totalTime: json["total_time"],
    districts: List<dynamic>.from(json["districts"].map((x) => x)),
    insurance: json["insurance"],
    helmet: json["helmet"],
    usedTime: json["used_time"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "price_per_hour": pricePerHour,
    "total_time": totalTime,
    "districts": List<dynamic>.from(districts.map((x) => x)),
    "insurance": insurance,
    "helmet": helmet,
    "used_time": usedTime,
  };
}
