// To parse this JSON data, do
//
//     final suppliersGet = suppliersGetFromJson(jsonString);

import 'dart:convert';

List<SuppliersGet> suppliersGetFromJson(String str) => List<SuppliersGet>.from(
    json.decode(str).map((x) => SuppliersGet.fromJson(x)));

String suppliersGetToJson(List<SuppliersGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SuppliersGet {
  SuppliersGet({
    required this.supId,
    required this.supNameEn,
    required this.supCode,
    required this.supSiren,
  });

  int supId;
  String supNameEn;
  String supCode;
  String supSiren;

  factory SuppliersGet.fromJson(Map<String, dynamic> json) => SuppliersGet(
        supId: json["sup_id"],
        supNameEn: json["sup_name_en"],
        supCode: json["sup_code"],
        supSiren: json["sup_siren"],
      );

  Map<String, dynamic> toJson() => {
        "sup_id": supId,
        "sup_name_en": supNameEn,
        "sup_code": supCode,
        "sup_siren": supSiren,
      };
}
