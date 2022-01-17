import 'dart:convert';

PlantInfo plantInfoFromJson(String str) => PlantInfo.fromJson(json.decode(str));

String plantInfoToJson(PlantInfo data) => json.encode(data.toJson());

class PlantInfo {
  List<Datum>? data;
  bool? success;
  // ignore: unnecessary_question_mark
  dynamic? message;

  PlantInfo({
    this.data,
    this.success,
    this.message,
  });

  factory PlantInfo.fromJson(Map<String, dynamic> json) => PlantInfo(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class Datum {
  String? databaseName;
  int? trexCompanyId;
  String? kpiType;

  Datum({
    this.databaseName,
    this.trexCompanyId,
    this.kpiType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        databaseName: json["databaseName"],
        trexCompanyId: json["trexCompanyId"],
        kpiType: json["kpiType"],
      );

  Map<String, dynamic> toJson() => {
        "databaseName": databaseName,
        "trexCompanyId": trexCompanyId,
        "kpiType": kpiType,
      };
}
