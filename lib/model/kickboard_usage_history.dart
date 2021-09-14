// To parse this JSON data, do
//
//     final kickboardUsageHistory = kickboardUsageHistoryFromJson(jsonString);

import 'dart:convert';

KickboardUsageHistory kickboardUsageHistoryFromJson(String str) => KickboardUsageHistory.fromJson(json.decode(str));

String kickboardUsageHistoryToJson(KickboardUsageHistory data) => json.encode(data.toJson());

class KickboardUsageHistory {
  KickboardUsageHistory({
    this.unit,
    this.history,
    this.totalTime,
  });

  int unit;
  List<History> history;
  int totalTime;

  factory KickboardUsageHistory.fromJson(Map<String, dynamic> json) => KickboardUsageHistory(
    unit: json["unit"],
    history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
    totalTime: json["total_time"],
  );

  Map<String, dynamic> toJson() => {
    "unit": unit,
    "history": List<dynamic>.from(history.map((x) => x.toJson())),
    "total_time": totalTime,
  };
}

class History {
  History({
    this.departTime,
    this.lists,
    this.interval,
    this.brand,
    this.arriveTime,
  });

  DateTime departTime;
  List<List<String>> lists;
  int interval;
  String brand;
  DateTime arriveTime;

  factory History.fromJson(Map<String, dynamic> json) => History(
    departTime: DateTime.parse(json["depart_time"]),
    lists: List<List<String>>.from(json["lists"].map((x) => List<String>.from(x.map((x) => x)))),
    interval: json["interval"],
    brand: json["brand"],
    arriveTime: DateTime.parse(json["arrive_time"]),
  );

  Map<String, dynamic> toJson() => {
    "depart_time": departTime.toIso8601String(),
    "lists": List<dynamic>.from(lists.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "interval": interval,
    "brand": brand,
    "arrive_time": arriveTime.toIso8601String(),
  };
}
