import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trex_home_page/utilities/constants.dart';

class HomeDraver extends StatefulWidget {
  const HomeDraver({Key? key}) : super(key: key);

  @override
  _HomeDraverState createState() => _HomeDraverState();
}

class _HomeDraverState extends State<HomeDraver> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Container(
      color: const Color(0xff0F4C75),
      child: buildDrawer(context, screenHeigth),
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
}
