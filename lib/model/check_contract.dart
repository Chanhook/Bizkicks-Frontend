// To parse this JSON data, do
//
//     final checkContract = checkContractFromJson(jsonString);

import 'dart:convert';

CheckContract checkContractFromJson(String str) =>
    CheckContract.fromJson(json.decode(str));

String checkContractToJson(CheckContract data) => json.encode(data.toJson());

class CheckContract {
  CheckContract({
    this.type,
    this.startdate,
    this.list,
    this.duedate,
  });

  String type;
  DateTime startdate;
  List<ListElement> list;
  DateTime duedate;

  factory CheckContract.fromJson(Map<String, dynamic> json) {
    print("과연?");
    print(json["type"]);
    if (json["type"] == "membership") {
      return CheckContract(
        type: json["type"],
        startdate: DateTime.parse(json["startdate"]),
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        duedate: DateTime.parse(json["duedate"]),
      );
    }else{
      return CheckContract(
        type: json["type"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "startdate":
            "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "duedate":
            "${duedate.year.toString().padLeft(4, '0')}-${duedate.month.toString().padLeft(2, '0')}-${duedate.day.toString().padLeft(2, '0')}",
      };
}

class ListElement {
  ListElement({
    this.companyName,
    this.districts,
    this.insurance,
    this.helmet,
    this.usedTime,
    this.totalTime,
    this.start_date,
    this.price_per_hour,
  });

  String companyName;
  List<dynamic> districts;
  bool insurance;
  bool helmet;
  int usedTime;
  int totalTime;
  DateTime start_date;
  int price_per_hour;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        companyName: json["company_name"],
        districts: List<dynamic>.from(json["districts"].map((x) => x)),
        insurance: json["insurance"],
        helmet: json["helmet"],
        usedTime: json["used_time"],
        totalTime: json["total_time"],
        start_date: DateTime.parse(json["start_date"]),
    price_per_hour: json["price_per_hour"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "districts": List<dynamic>.from(districts.map((x) => x)),
        "insurance": insurance,
        "helmet": helmet,
        "used_time": usedTime,
        "total_time": totalTime,
    "start_date":start_date,
    "price_per_hour":price_per_hour,
      };
}
