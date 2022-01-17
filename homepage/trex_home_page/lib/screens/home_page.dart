import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/home_screen.dart';
import 'package:trex_home_page/screens/qee_analysis/qee_analysis.screen.dart';
import 'package:trex_home_page/screens/reports/reports_screen.dart';
import 'package:trex_home_page/screens/stoppage_analysis/stoppage_analysis_screen.dart';
import 'package:trex_home_page/utilities/constants.dart';
import 'package:trex_home_page/widgets/home_page_widgets/appbar_title_widget.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    const Home(),
    QueAnalysisScreen(),
    StoppageAnalysisScreen(),
    ReportsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final items = <Widget>[
      Column(
        children: [
          Icon(
            Icons.home,
            size: screenSize.width * 0.065,
          ),
          const Text("Home"),
          Text("")
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.graphic_eq,
            size: screenSize.width * 0.065,
          ),
          const Text("QEE"),
          const Text("Analysis")
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.access_time_filled,
            size: screenSize.width * 0.065,
          ),
          Text("Stoppage"),
          Text("Analysis")
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.folder,
            size: screenSize.width * 0.065,
          ),
          Text("Reports"),
          Text("")
        ],
      ),
    ];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        /*appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: buildAppBarTitle(screenSize, context),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Icon(
                Icons.email,
                color: Colors.white,
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              Icon(
                Icons.autorenew,
                color: Colors.white,
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
            ])
          ],
        ),*/
        body: screens[index],
        drawer: buildDrawer(context),
        bottomNavigationBar: SingleChildScrollView(
          child: CurvedNavigationBar(
            index: index,
            height: screenSize.width * 0.138,
            items: items,
            color: Color.fromRGBO(193, 214, 233, 1),
            backgroundColor: Colors.blueGrey.shade800,
            onTap: (index) => setState(() {
              this.index = index;
            }),
          ),
        ),
      ),
    );
  }

  createMenuItems(BuildContext context) {
    createNavigationItem(var icon, String pageName, String pageRoute) {
      return ListTile(
          leading: Icon(icon),
          title: Text(pageName),
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(pageRoute);
            });
          });
    }

    var navigationList = [
      createNavigationItem(Icons.home, "Home", "/"),
      createNavigationItem(
          Icons.graphic_eq, "QEE Analysis", Constants.ROUTE_QEE_ANALYSIS),
      createNavigationItem(Icons.graphic_eq, "Stoppage Analysis",
          Constants.ROUTE_STOPPAGE_ANALYSIS),
    ];

    ListView menuItems = ListView(
      children: navigationList,
    );
    return Drawer(
      child: menuItems,
    );
  }

  buildDrawer(BuildContext context) {
    return Drawer(child: createMenuItems(context));
  }

  buildBody(index) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            Text(index.toString()),
          ],
        ),
      ),
    );
  }
}
