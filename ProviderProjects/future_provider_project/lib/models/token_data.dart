import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.data,
    this.success,
    this.message,
  });

  Data? data;
  bool? success;
  // ignore: unnecessary_question_mark
  dynamic? message;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        data: Data.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "success": success,
        "message": message,
      };
}

class Data {
  String? accessToken;
  DateTime? expiration;
  Data({
    this.accessToken,
    this.expiration,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        expiration: DateTime.parse(json["expiration"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiration": expiration!.toIso8601String(),
      };
}
