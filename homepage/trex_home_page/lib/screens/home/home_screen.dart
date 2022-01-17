import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/charts/linecard_container.dart';
import 'package:trex_home_page/screens/home/charts/donutchart.dart';
import 'package:trex_home_page/screens/home/settings/settings_screen.dart';

import 'charts/donut_chart2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.02,
        backgroundColor: const Color.fromRGBO(193, 214, 233, 1),
        bottom: TabBar(
          labelColor: Colors.red,
          controller: _tabController,
          indicatorColor: Colors.black,
          isScrollable: true,
          tabs: [
            Container(
              child: const Tab(
                  icon: Icon(
                Icons.pie_chart,
                size: 30,
                color: Colors.black,
              )),
              width: screenWidth * 0.4,
            ),
            Container(
              child: const Tab(
                  icon: Icon(
                Icons.settings,
                size: 30,
                color: Colors.black,
              )),
              width: screenWidth * 0.4,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                /*image: const DecorationImage(
                    image: AssetImage('images/background5.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black45, BlendMode.darken)),*/
                color: Color.fromRGBO(193, 214, 233, 1),
              ),
              padding: EdgeInsets.only(
                  bottom: screenHeigth * 0.1, top: screenHeigth * 0.02),
              child: Column(
                children: const [
                  ShowDonutChart(),
                  ShowDonutChart2(),
                  ShowLineCardContainer(),
                ],
              ),
            ),
          ),
          const SettingsScreen(),
        ],
      ),
    );
  }
}

class Task {
  late String task;
  late double taskValue;
  late Color colorValue;

  Task(this.task, this.taskValue, this.colorValue);
}
