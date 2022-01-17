import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    scontroller.addListener(listenScrolling);
    _tabController = TabController(length: 10, initialIndex: 0, vsync: this);
    super.initState();
  }

  void listenScrolling() {
    if (scontroller.position.atEdge) {
      const isTop = 0;
      final isEnd = scontroller.position.maxScrollExtent;
      if (scontroller.position.pixels == isTop) {
        setState(() {
          opacityValue1 = 0.0;
          opacityValue2 = 1.0;
        });
      } else if (scontroller.position.pixels == isEnd) {
        setState(() {
          opacityValue1 = 1.0;
          opacityValue2 = 0.0;
        });
      }
    }
    if (scontroller.position.pixels > 0 &&
        scontroller.position.pixels < scontroller.position.maxScrollExtent) {
      setState(() {
        opacityValue1 = 1.0;
        opacityValue2 = 1.0;
      });
    }
  }

  void dispone() {
    _tabController.dispose();
    super.dispose();
  }

  final scontroller = ScrollController();
  int index = 0;
  double textSizeTemp = 12;
  double textSizeSmall = 12;
  double textSizeBig = 14;

  double opacityValue1 = 0.0;
  double opacityValue2 = 1.0;
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
      drawer: Container(
        color: const Color(0xff0F4C75),
        child: buildDrawer(context, screenHeigth),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: const Color(0xffF9F7F7),
          boxShadow: const [
            BoxShadow(
                spreadRadius: -9,
                blurRadius: 17,
                offset: Offset(-5, -5),
                color: Colors.blueGrey),
            BoxShadow(
                spreadRadius: -9,
                blurRadius: 10,
                offset: Offset(7, 7),
                color: Colors.blueGrey),
          ],
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: scontroller,
              child: TabBar(
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2)),
                controller: _tabController,
                indicatorColor: const Color(0xff0F4C75),
                unselectedLabelColor: const Color(0xffBBBBBB),
                labelColor: const Color(0xff0F4C75),
                isScrollable: true,
                onTap: (index) => setState(() {
                  this.index = index;
                }),
                tabs: [
                  bottomDriverWidget("Home", "", const Icon(Icons.home),
                      screenWidth, screenHeigth),
                  bottomDriverWidget("QEE", "Analysis",
                      const Icon(Icons.graphic_eq), screenWidth, screenHeigth),
                  bottomDriverWidget(
                      "Stoppage",
                      "Analysis",
                      const Icon(Icons.timelapse_outlined),
                      screenWidth,
                      screenHeigth),
                  bottomDriverWidget("Scrape", "Analysis",
                      const Icon(Icons.code), screenWidth, screenHeigth),
                  bottomDriverWidget(
                      "Plan./Actual",
                      "Analysis",
                      const Icon(Icons.app_registration),
                      screenWidth,
                      screenHeigth),
                  bottomDriverWidget("Personel", "Analysis",
                      const Icon(Icons.person), screenWidth, screenHeigth),
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
            Opacity(
              opacity: opacityValue1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.arrow_back, color: Color(0xff0F4C75)),
                ],
              ),
            ),
            Opacity(
              opacity: opacityValue2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.arrow_forward_rounded, color: Color(0xff0F4C75)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//DRAVER
  createMenuItems(BuildContext context) {
    createNavigationItem(var icon, Widget widget, String pageRoute) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: ListTile(
            focusColor: const Color(0xff0F4C75),
            //leading: Icon(icon),
            title: Column(
              children: [
                Icon(
                  icon,
                  color: const Color(0xff0F4C75),
                ),
                widget,
              ],
            ),
            onTap: () {
              setState(() {
                if (pageRoute == "Logout") {
                  SystemNavigator.pop();
                } else {
                  Navigator.of(context).pushNamed(pageRoute);
                }
              });
            }),
      );
    }

    var navigationList = [
      createNavigationItem(
          Icons.home,
          const Text(
            "Home",
            style: TextStyle(
              color: Color(0xff0F4C75),
            ),
          ),
          "/"),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.graphic_eq,
          const Text(
            "QEE Analysis",
            style: TextStyle(
              color: Color(0xff0F4C75),
            ),
          ),
          Constants.ROUTE_QEE_ANALYSIS),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.timelapse_outlined,
          Column(
            children: const [
              Text(
                "Stoppage",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              ),
              Text(
                "Analysis",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              )
            ],
          ),
          Constants.ROUTE_STOPPAGE_ANALYSIS),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.code,
          const Text(
            "Scrape Analysis",
            style: TextStyle(
              color: Color(0xff0F4C75),
            ),
          ),
          Constants.ROUTE_QEE_ANALYSIS),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.app_registration,
          Column(
            children: const [
              Text(
                "Plan./Actual",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              ),
              Text(
                "Analysis",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              )
            ],
          ),
          Constants.ROUTE_PLAN_ACTUAL_ANALYSIS_SCREEN),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.person,
          Column(
            children: const [
              Text(
                "Personel",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              ),
              Text(
                "Analysis",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              )
            ],
          ),
          Constants.ROUTE_QEE_ANALYSIS),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.trending_up,
          Column(
            children: const [
              Text(
                "QEE Trend",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              ),
              Text(
                "Analysis",
                style: TextStyle(
                  color: Color(0xff0F4C75),
                ),
              )
            ],
          ),
          Constants.ROUTE_QEE_TREND_ANALYSIS_SCREEN),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.trending_up,
          Column(children: const [
            Text(
              "Scrap Trend",
              style: TextStyle(
                color: Color(0xff0F4C75),
              ),
            ),
            Text(
              "Analysis",
              style: TextStyle(
                color: Color(0xff0F4C75),
              ),
            )
          ]),
          Constants.ROUTE_SCRAP_TREND_ANALYSIS_SCREEN),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.trending_up,
          Column(children: const [
            Text(
              "Stopages Trend",
              style: TextStyle(
                color: Color(0xff0F4C75),
              ),
            ),
            Text(
              "Analysis",
              style: TextStyle(
                color: Color(0xff0F4C75),
              ),
            )
          ]),
          Constants.ROUTE_STOPPAGES_TREND_ANALYSIS_SCREEN),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.folder,
          const Text(
            "Reports",
            style: TextStyle(
              color: Color(0xff0F4C75),
            ),
          ),
          Constants.ROUTE_QEE_ANALYSIS),
      const SizedBox(
        height: 7,
      ),
      createNavigationItem(
          Icons.exit_to_app,
          const Text(
            "Logout",
            style: TextStyle(
              color: Color(0xff0F4C75),
            ),
          ),
          "Logout"),
      const SizedBox(
        height: 7,
      ),
    ];

    ListView menuItems = ListView(
      children: navigationList,
    );
    return Drawer(
      child: menuItems,
    );
  }

  buildDrawer(BuildContext context, screenHeigth) {
    return Container(
        margin: EdgeInsets.only(top: screenHeigth * 0.138),
        width: 150,
        child: Drawer(child: createMenuItems(context)));
  }

  buildBody(index) {
    // ignore: avoid_unnecessary_containers
    return Container(
      //color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home),
            Text(index.toString()),
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
