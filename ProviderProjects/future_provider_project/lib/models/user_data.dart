import 'dart:convert';

UserData userFromJson(String value) => UserData.fromJson(json.decode(value));

String userToJson(UserData data) => json.encode(data.toJson());

class UserData {
  Data? data;
  bool? success;
  // ignore: unnecessary_question_mark
  dynamic? message;

  UserData({
    this.data,
    this.success,
    this.message,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
  int? id;
  String? plantNo;
  String? userName;
  String? emailAddress;
  Data({
    this.id,
    this.plantNo,
    this.userName,
    this.emailAddress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        plantNo: json["plantNo"],
        userName: json["userName"],
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plantNo": plantNo,
        "userName": userName,
        "emailAddress": emailAddress,
      };
}



/*class UserData {
  List<UserData>? userData;
  bool? success;
  String? message;

  UserData(List<UserData> userData, bool success, String message) {
    this.userData;
    this.success;
    this.message;
  }

  UserData.fromMap(Map map) {
    var list =map['data'] as List; 
    List<UserData> userDataList=list.map((userData) => UserData.fromMap(userData)).toList();
    userData:userDataList
    success = map['success'];
    message = map['message'];
  }

  Map toMap() {
    return {"data": userData, "success": success, "message": message};
  }
}

class UserData {
  int? id;
  String? plantNo;
  String? userName;
  String? emailAddress;

  UserData(int id, String plantNo, String userName, String emailAddress) {
    this.id;
    this.plantNo;
    this.userName;
    this.emailAddress;
  }

  UserData.fromMap(Map map) {
    id = map['id'];
    plantNo = map['plantNo'];
    userName = map['userName'];
    emailAddress = map['emailAddress'];
  }

  Map toMap() {
    return {
      "id": id,
      "plantNo": plantNo,
      "userName": userName,
      "emailAddress": emailAddress
    };
  }
}*/
