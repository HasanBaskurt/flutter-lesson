import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/home/home_draver.dart';
import 'package:trex_home_page/screens/home/home_screen.dart';
import 'package:trex_home_page/screens/personel_analysis/personel_analysis_screen.dart';
import 'package:trex_home_page/screens/plan_actual_analysis/plan_actual_analysis_screen.dart';
import 'package:trex_home_page/screens/qee_analysis/qee_analysis.screen.dart';
import 'package:trex_home_page/screens/qee_trend_analysis/qee_trend_analysis.screen.dart';
import 'package:trex_home_page/screens/reports/reports_screen.dart';
import 'package:trex_home_page/screens/scrap_trend_analysis/scrap_trend_analysis.screen.dart';
import 'package:trex_home_page/screens/scrape_analysis/scrope_analysis_screen.dart';
import 'package:trex_home_page/screens/stoppage_analysis/stoppage_analysis_screen.dart';
import 'package:trex_home_page/screens/stoppages_trend_analysis/stoppages_trend_analysis.screen.dart';
import 'package:trex_home_page/utilities/constants.dart';
import 'package:trex_home_page/widgets/home_page_widgets/appbar_title_widget.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 10, initialIndex: 0, vsync: this);
    super.initState();
  }

  void dispone() {
    _tabController.dispose();
    super.dispose();
  }

  int index = 0;
  double textSizeTemp = 12;
  double textSizeSmall = 12;
  double textSizeBig = 14;
  final screens = [
    const Home(),
    const QueAnalysisScreen(),
    const StoppageAnalysisScreen(),
    const ScropeAnalysisScreen(),
    const PlanActualAnalysisScreen(),
    const PersonelAnalysisScreen(),
    const QueTrendAnalysisScreen(),
    const ScrapTrendAnalysisScreen(),
    const StoppagesTrendAnalysisScreen(),
    const ReportsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.08,
        backgroundColor: const Color(0xff0F4C75),
        title: buildAppBarTitle(screenSize, context),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, Constants.ROUTE_EMAIL_SCREEN);
                });
              },
              child: const Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.autorenew,
              color: Colors.white,
            ),
            SizedBox(
              width: screenSize.width * 0.03,
            ),
          ])
        ],
      ),
      body: screens[index],
      drawer: const HomeDraver(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: screenHeigth * 0.005,
          bottom: screenHeigth * 0.005,
        ),
        //constraints: BoxConstraints(maxHeight: screenHeigth * 0.09),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: const Color(0xffF9F7F7),
          boxShadow: const [
            BoxShadow(
                spreadRadius: -4,
                blurRadius: 2,
                offset: Offset(0.5, -0.5),
                color: Colors.blueGrey),
            BoxShadow(
              spreadRadius: -4,
              blurRadius: 10,
              offset: Offset(-0.5, 0.5),
              color: Colors.blueGrey,
            ),
          ],
        ),
        child: TabBar(
          indicator:
              const UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
          controller: _tabController,
          indicatorColor: const Color(0xff0F4C75),
          unselectedLabelColor: const Color(0xffBBBBBB),
          labelColor: const Color(0xff0F4C75),
          isScrollable: true,
          onTap: (index) => setState(() {
            this.index = index;
          }),
          tabs: [
            bottomDriverWidget(
                "Home", "", const Icon(Icons.home), screenWidth, screenHeigth),
            bottomDriverWidget("QEE", "Analysis", const Icon(Icons.graphic_eq),
                screenWidth, screenHeigth),
            bottomDriverWidget(
                "Stoppage",
                "Analysis",
                const Icon(Icons.timelapse_outlined),
                screenWidth,
                screenHeigth),
            bottomDriverWidget("Scrape", "Analysis", const Icon(Icons.code),
                screenWidth, screenHeigth),
            bottomDriverWidget("Plan./Actual", "Analysis",
                const Icon(Icons.app_registration), screenWidth, screenHeigth),
            bottomDriverWidget("Personel", "Analysis", const Icon(Icons.person),
                screenWidth, screenHeigth),
            bottomDriverWidget("QEE Trend", "Analysis",
                const Icon(Icons.trending_up), screenWidth, screenHeigth),
            bottomDriverWidget("Scrap Trend", "Analysis",
                const Icon(Icons.trending_up), screenWidth, screenHeigth),
            bottomDriverWidget("Stopages Trend", "Analysis",
                const Icon(Icons.trending_up), screenWidth, screenHeigth),
            bottomDriverWidget("Reports", "", const Icon(Icons.folder),
                screenWidth, screenHeigth),
          ],
        ),
      ),
    );
  }

//Bottom Navigator Tab
  Widget bottomDriverWidget(String text1, String text2, Icon icon,
      double screenWidth, double screenHeigth) {
    if (text1.length > 10) {
      screenWidth = screenWidth * 0.30;
    } else {
      screenWidth = screenWidth * 0.20;
    }
    // ignore: sized_box_for_whitespace
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(
          text1,
          style: TextStyle(fontSize: textSizeBig),
        ),
        /*Text(
          text2,
          style: TextStyle(fontSize: textSizeBig),
        ),*/
      ],
    );
  }
}
