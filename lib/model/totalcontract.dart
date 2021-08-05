// To parse this JSON data, do
//
//     final totalContract = totalContractFromJson(jsonString);

import 'dart:convert';

TotalContract totalContractFromJson(String str) => TotalContract.fromJson(json.decode(str));

String totalContractToJson(TotalContract data) => json.encode(data.toJson());

class TotalContract {
  TotalContract({
    this.list,
  });

  List<ListElement> list;

  factory TotalContract.fromJson(Map<String, dynamic> json) => TotalContract(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
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
