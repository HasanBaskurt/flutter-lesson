import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:survey/main.dart';
import 'package:survey/screens/survey_screen.dart';
import 'package:survey/utilities/constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_SAMPLE_SCREEN: (BuildContext context) => Survey(),
  };
}
