import 'package:flutter/cupertino.dart';
import 'package:trex_home_page/screens/home/settings/no_shift_screen.dart';
import 'package:trex_home_page/screens/home/settings/planned_stoppage_screen.dart';
import 'package:trex_home_page/screens/home/settings/po_loaded_screen.dart';
import 'package:trex_home_page/screens/home/settings/po_waiting_screen.dart';
import 'package:trex_home_page/screens/home/settings/running_screen.dart';
import 'package:trex_home_page/screens/home/settings/stoppage_screen.dart';
import 'package:trex_home_page/screens/home/settings/stopped_screen.dart';
import 'package:trex_home_page/screens/home/settings/unplanned_stoppage_screen.dart';
import 'package:trex_home_page/screens/qee_analysis/qee_analysis.screen.dart';
import 'package:trex_home_page/screens/stoppage_analysis/stoppage_analysis_screen.dart';
import 'package:trex_home_page/utilities/constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_QEE_ANALYSIS: (BuildContext context) => QueAnalysisScreen(),
    Constants.ROUTE_STOPPAGE_ANALYSIS: (BuildContext context) =>
        StoppageAnalysisScreen(),
    Constants.ROUTE_RUNNING_SCREEN: (BuildContext context) => RunningScreen(),
    Constants.ROUTE_STOPPED_SCREEN: (BuildContext context) => StoppedScreen(),
    Constants.ROUTE_STOPPAGE_SCREEN: (BuildContext context) => StoppageScreen(),
    Constants.ROUTE_PLANNED_STOPPAGE_SCREEN: (BuildContext context) =>
        PlannedStoppageScreen(),
    Constants.ROUTE_UNPLANNED_STOPPAGE_SCREEN: (BuildContext context) =>
        UnplannedStoppageScreen(),
    Constants.ROUTE_PO_LOADED_SCREEN: (BuildContext context) =>
        PoLoadedScreen(),
    Constants.ROUTE_PO_WAITING_SCREEN: (BuildContext context) =>
        PoWaitingScreen(),
    Constants.ROUTE_NO_SHIFT_SCREEN: (BuildContext context) => NoShiftScreen(),
  };
}
