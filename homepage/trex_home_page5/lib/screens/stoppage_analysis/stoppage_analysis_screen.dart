import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/charts/barchart_qee.dart';
import 'package:trex_home_page/screens/home/charts/donutchart3.dart';

class StoppageAnalysisScreen extends StatefulWidget {
  const StoppageAnalysisScreen({Key? key}) : super(key: key);

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
      backgroundColor: const Color(0xffF9F7F7),
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.02,
        backgroundColor: const Color(0xffF9F7F7),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xff0F4C75),
          isScrollable: true,
          tabs: [
            // ignore: sized_box_for_whitespace
            Container(
              child: const Tab(
                  icon: Icon(
                Icons.pie_chart,
                size: 30,
                color: Color(0xff0F4C75),
              )),
              width: screenWidth * 0.4,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              child: const Tab(
                  icon: Icon(
                Icons.bar_chart,
                size: 30,
                color: Color(0xff0F4C75),
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
                color: Color(0xffF9F7F7),
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
                color: Color(0xffF9F7F7),
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
