import 'package:flutter/cupertino.dart';
import 'package:trex_home_page/home/email_screen.dart';
import 'package:trex_home_page/screens/home/settings/no_shift/no_shift_screen.dart';
import 'package:trex_home_page/screens/home/settings/planned_stoppage/planned_stoppage_screen.dart';
import 'package:trex_home_page/screens/home/settings/po_loaded/po_loaded_screen.dart';
import 'package:trex_home_page/screens/home/settings/po_waiting/po_waiting_screen.dart';
import 'package:trex_home_page/screens/home/settings/running/running_screen.dart';
import 'package:trex_home_page/screens/home/settings/stoppage/stoppage_screen.dart';
import 'package:trex_home_page/screens/home/settings/stopped/stopped_screen.dart';
import 'package:trex_home_page/screens/home/settings/unplanned_stoppage/unplanned_stoppage_screen.dart';
import 'package:trex_home_page/screens/plan_actual_analysis/plan_actual_analysis_screen.dart';
import 'package:trex_home_page/screens/qee_analysis/qee_analysis.screen.dart';
import 'package:trex_home_page/screens/qee_trend_analysis/qee_trend_analysis.screen.dart';
import 'package:trex_home_page/screens/scrap_trend_analysis/scrap_trend_analysis.screen.dart';
import 'package:trex_home_page/screens/stoppage_analysis/stoppage_analysis_screen.dart';
import 'package:trex_home_page/screens/stoppages_trend_analysis/stoppages_trend_analysis.screen.dart';
import 'package:trex_home_page/utilities/constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_QEE_ANALYSIS: (BuildContext context) =>
        const QueAnalysisScreen(),
    Constants.ROUTE_STOPPAGE_ANALYSIS: (BuildContext context) =>
        const StoppageAnalysisScreen(),
    Constants.ROUTE_RUNNING_SCREEN: (BuildContext context) =>
        const RunningScreen(),
    Constants.ROUTE_STOPPED_SCREEN: (BuildContext context) =>
        const StoppedScreen(),
    Constants.ROUTE_STOPPAGE_SCREEN: (BuildContext context) =>
        const StoppageScreen(),
    Constants.ROUTE_PLANNED_STOPPAGE_SCREEN: (BuildContext context) =>
        const PlannedStoppageScreen(),
    Constants.ROUTE_UNPLANNED_STOPPAGE_SCREEN: (BuildContext context) =>
        const UnplannedStoppageScreen(),
    Constants.ROUTE_PO_LOADED_SCREEN: (BuildContext context) =>
        const PoLoadedScreen(),
    Constants.ROUTE_PO_WAITING_SCREEN: (BuildContext context) =>
        const PoWaitingScreen(),
    Constants.ROUTE_NO_SHIFT_SCREEN: (BuildContext context) =>
        const NoShiftScreen(),
    Constants.ROUTE_EMAIL_SCREEN: (BuildContext context) => const EmailScreen(),
    Constants.ROUTE_PLAN_ACTUAL_ANALYSIS_SCREEN: (BuildContext context) =>
        const PlanActualAnalysisScreen(),
    Constants.ROUTE_QEE_TREND_ANALYSIS_SCREEN: (BuildContext context) =>
        const QueTrendAnalysisScreen(),
    Constants.ROUTE_SCRAP_TREND_ANALYSIS_SCREEN: (BuildContext context) =>
        const ScrapTrendAnalysisScreen(),
    Constants.ROUTE_STOPPAGES_TREND_ANALYSIS_SCREEN: (BuildContext context) =>
        const StoppagesTrendAnalysisScreen(),
  };
}
