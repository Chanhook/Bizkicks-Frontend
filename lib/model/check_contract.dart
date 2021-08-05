// To parse this JSON data, do
//
//     final checkContract = checkContractFromJson(jsonString);

import 'dart:convert';

CheckContract checkContractFromJson(String str) => CheckContract.fromJson(json.decode(str));

String checkContractToJson(CheckContract data) => json.encode(data.toJson());

class CheckContract {
  CheckContract({
    this.type,
    this.duedate,
    this.list,
  });

  String type;
  DateTime duedate;
  List<ListElement> list;

  factory CheckContract.fromJson(Map<String, dynamic> json) => CheckContract(
    type: json["type"],
    duedate: DateTime.parse(json["duedate"]),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "duedate": "${duedate.year.toString().padLeft(4, '0')}-${duedate.month.toString().padLeft(2, '0')}-${duedate.day.toString().padLeft(2, '0')}",
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.companyName,
    this.pricePerHour,
    this.serviceLocation,
    this.insurance,
    this.helmet,
  });

  String companyName;
  int pricePerHour;
  List<String> serviceLocation;
  bool insurance;
  bool helmet;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    companyName: json["company_name"],
    pricePerHour: json["price_per_hour"],
    serviceLocation: List<String>.from(json["service_location"].map((x) => x)),
    insurance: json["insurance"],
    helmet: json["helmet"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "price_per_hour": pricePerHour,
    "service_location": List<dynamic>.from(serviceLocation.map((x) => x)),
    "insurance": insurance,
    "helmet": helmet,
  };
}
