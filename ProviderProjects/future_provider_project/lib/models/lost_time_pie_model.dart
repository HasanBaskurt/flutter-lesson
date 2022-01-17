// To parse this JSON data, do
//
//     final lostTimePie = lostTimePieFromJson(jsonString);

import 'dart:convert';

LostTimePie lostTimePieFromJson(String str) =>
    LostTimePie.fromJson(json.decode(str));

String lostTimePieToJson(LostTimePie data) => json.encode(data.toJson());

class LostTimePie {
  LostTimePie({
    this.data,
    this.success,
    this.message,
  });

  List<LostTimePieData>? data;
  bool? success;
  dynamic message;

  factory LostTimePie.fromJson(Map<String, dynamic> json) => LostTimePie(
        data: List<LostTimePieData>.from(
            json["data"].map((x) => LostTimePieData.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class LostTimePieData {
  LostTimePieData({
    this.companyId,
    this.typeId,
    this.type,
    this.percentage,
    this.color,
  });

  int? companyId;
  int? typeId;
  String? type;
  double? percentage;
  String? color;

  factory LostTimePieData.fromJson(Map<String, dynamic> json) =>
      LostTimePieData(
        companyId: json["companyId"],
        typeId: json["typeId"],
        type: json["type"],
        percentage: json["percentage"].toDouble(),
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "typeId": typeId,
        "type": type,
        "percentage": percentage,
        "color": color,
      };
}
