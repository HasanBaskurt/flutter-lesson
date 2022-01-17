import 'dart:io';


import 'package:future_provider_project/models/config_info.dart';
import 'package:future_provider_project/models/lost_time_pie_model.dart';
import 'package:future_provider_project/models/plant_info.dart';
import 'package:future_provider_project/models/token_data.dart';
import 'package:future_provider_project/models/user_data.dart';
import 'package:http/http.dart' as http;

class TrexApi {
  //main uri: "http://10.0.2.2:5000"  // Apikey : 7755626139
  static String baseUri = "";
  static const tokenUri = "/api/Oauth/GetToken?appName=DCASDCAS";
  static const configInfoUri = "/api/Config/GetConfigInfo";
  static const userUri = "/api/User/Login";
  static const plantInfoUri = "/api/Plant/GetPlantInfo";
  static const lostTimePieUri = "/api/Graphic/GetLostTimePie?";

  // User
  static Future<UserData> postUser(
      String userName, String password, String webUser, String key) async {
    var response = await http.post(
        Uri.parse(baseUri +
            userUri +
            "?Username=" +
            userName +
            "&Password=" +
            password +
            "&WebUser=" +
            webUser +
            "&Key=" +
            key),
        body: {});
    if (response.statusCode == 200) {
      UserData users = userFromJson(response.body);
      return users;
    } else {
      return UserData();
    }
  }

  // Token
  static Future<Token> getToken(String value) async {
    baseUri = value;
    var response = await http.get(Uri.parse(baseUri + tokenUri));
    if (response.statusCode == 200) {
      Token token = tokenFromJson(response.body);
      return token;
    } else {
      return Token();
    }
  }

  // Config Info
  static Future<ConfigInfo> getConfigInfo(String value) async {
    var response = await http.get(Uri.parse(baseUri + configInfoUri),
        headers: {HttpHeaders.authorizationHeader: "Bearer " + value});
    if (response.statusCode == 200) {
      ConfigInfo configInfo = configInfoFromJson(response.body);
      return configInfo;
    } else {
      return ConfigInfo();
    }
  }

  // Plant Info
  static Future<PlantInfo> getPlantInfo(
      String token, String apiKey, String key) async {
    var response = await http.get(
        Uri.parse(baseUri + plantInfoUri + "?ApiKey=" + apiKey + "&Key=" + key),
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    if (response.statusCode == 200) {
      PlantInfo plantInfo = plantInfoFromJson(response.body);
      return plantInfo;
    } else {
      return PlantInfo();
    }
  }

  // Lost Time Pie
  static Future<LostTimePie> getLostTimePie(
      String token, String userId, String key) async {
    var response = await http.get(
        Uri.parse(baseUri +
            lostTimePieUri +
            "CompanyId=13" +
            "&UserId" +
            userId +
            "&PWorkStationId=0&PWorkCenterId=0&Shift=0&PlantId=1&LangId=2&Top=10&TrexId=1" +
            "&Key=" +
            key),
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    if (response.statusCode == 200) {
      LostTimePie lostTimePie = lostTimePieFromJson(response.body);
      return lostTimePie;
    } else {
      return LostTimePie();
    }
  }
}
