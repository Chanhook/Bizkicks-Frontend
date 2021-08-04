// To parse this JSON data, do
//
//     final measuredRatePrice = measuredRatePriceFromJson(jsonString);

import 'dart:convert';

MeasuredRatePrice measuredRatePriceFromJson(String str) => MeasuredRatePrice.fromJson(json.decode(str));

String measuredRatePriceToJson(MeasuredRatePrice data) => json.encode(data.toJson());

class MeasuredRatePrice {
  MeasuredRatePrice({
    this.price,
  });

  int price;

  factory MeasuredRatePrice.fromJson(Map<String, dynamic> json) => MeasuredRatePrice(
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
  };
}
