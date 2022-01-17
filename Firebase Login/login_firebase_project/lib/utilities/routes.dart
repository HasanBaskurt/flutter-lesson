import 'package:flutter/cupertino.dart';
import 'package:login_firebase_project/screens/admin_login.dart';
import 'package:login_firebase_project/screens/admin_selection_screen.dart';
import 'package:login_firebase_project/screens/profile.dart';
import 'package:login_firebase_project/screens/survey.dart';
import 'package:login_firebase_project/screens/survey_list.dart';
import 'package:login_firebase_project/screens/user_login.dart';
import 'package:login_firebase_project/utilities/Constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_PROFILE: (BuildContext context) => Profile(),
    Constants.ROUTE_SURVEY: (BuildContext context) => Survey(),
    Constants.ROUTE_SURVEY_LIST: (BuildContext context) => SurveyList(),
    Constants.ROUTE_ADMIN_LOGIN: (BuildContext context) => AdminLogin(),
    Constants.ROUTE_USER_LOGIN: (BuildContext context) => UserLogin(),
    Constants.ROUTE_ADMIN_SELECTION_SECREEN: (BuildContext context) =>
        AdminSelectionScreen(),
  };
}
