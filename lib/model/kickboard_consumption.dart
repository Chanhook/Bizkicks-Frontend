// To parse this JSON data, do
//
//     final kickboardConsumption = kickboardConsumptionFromJson(jsonString);

import 'dart:convert';

KickboardConsumption kickboardConsumptionFromJson(String str) => KickboardConsumption.fromJson(json.decode(str));

String kickboardConsumptionToJson(KickboardConsumption data) => json.encode(data.toJson());

class KickboardConsumption {
  KickboardConsumption({
    this.brand,
    this.departTime,
    this.arriveTime,
    this.locationList,
    this.cycle,
  });

  String brand;
  DateTime departTime;
  DateTime arriveTime;
  List<LocationList> locationList;
  int cycle;

  factory KickboardConsumption.fromJson(Map<String, dynamic> json) => KickboardConsumption(
    brand: json["brand"],
    departTime: DateTime.parse(json["depart_time"]),
    arriveTime: DateTime.parse(json["arrive_time"]),
    locationList: List<LocationList>.from(json["location_list"].map((x) => LocationList.fromJson(x))),
    cycle: json["cycle"],
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "depart_time": departTime.toIso8601String(),
    "arrive_time": arriveTime.toIso8601String(),
    "location_list": List<dynamic>.from(locationList.map((x) => x.toJson())),
    "cycle": cycle,
  };
}

class LocationList {
  LocationList({
    this.latitude,
    this.longitude,
  });

  double latitude;
  double longitude;

  factory LocationList.fromJson(Map<String, dynamic> json) => LocationList(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
