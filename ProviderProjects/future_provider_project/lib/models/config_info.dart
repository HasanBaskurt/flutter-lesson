import 'dart:convert';

ConfigInfo configInfoFromJson(String str) =>
    ConfigInfo.fromJson(json.decode(str));

String configInfoToJson(ConfigInfo data) => json.encode(data.toJson());

class ConfigInfo {
  ConfigInfo({
    this.data,
    this.success,
    this.message,
  });

  List<Data>? data;
  bool? success;
  // ignore: unnecessary_question_mark
  dynamic? message;

  factory ConfigInfo.fromJson(Map<String, dynamic> json) => ConfigInfo(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class Data {
  Data({
    this.key,
    this.displayName,
  });

  String? key;
  String? displayName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        key: json["key"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "displayName": displayName,
      };
}
