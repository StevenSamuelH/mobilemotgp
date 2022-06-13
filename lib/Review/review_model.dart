// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Data> dataFromJson(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  Data({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.namaProduk,
    required this.gambarProduk,
    required this.reviewProduk,
    required this.ratingProduk,
  });

  String namaProduk;
  String gambarProduk;
  String reviewProduk;
  String ratingProduk;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        namaProduk: json["nama"],
        gambarProduk: json["gambar"],
        reviewProduk: json["review"],
        ratingProduk: json["rating"],
      );

  Map<String, String> toJson() => {
        "nama": namaProduk,
        "gambar": gambarProduk,
        "review": reviewProduk,
        "rating": ratingProduk,
      };
}
