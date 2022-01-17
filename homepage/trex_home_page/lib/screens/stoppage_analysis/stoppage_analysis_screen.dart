import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/charts/barchart_qee.dart';
import 'package:trex_home_page/screens/home/charts/donutchart.dart';
import 'package:trex_home_page/screens/home/charts/donutchart3.dart';

class StoppageAnalysisScreen extends StatefulWidget {
  StoppageAnalysisScreen({Key? key}) : super(key: key);

  @override
  _StoppageAnalysisScreenState createState() => _StoppageAnalysisScreenState();
}

class _StoppageAnalysisScreenState extends State<StoppageAnalysisScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  Color xColor = Colors.blueGrey.shade800, yColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.02,
        backgroundColor: Color.fromRGBO(193, 214, 233, 1),
        bottom: TabBar(
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
                Icons.bar_chart,
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
                color: Color.fromRGBO(193, 214, 233, 1),
              ),
              padding: EdgeInsets.only(
                  bottom: screenHeigth * 0.1, top: screenHeigth * 0.02),
              child: Column(
                children: const [
                  ShowDonutChart3(),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(193, 214, 233, 1),
              ),
              padding: EdgeInsets.only(
                  bottom: screenHeigth * 0.1, top: screenHeigth * 0.02),
              child: Column(
                children: const [
                  ShowBarChartQee(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
