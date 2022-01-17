import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/settings/running/running_card.dart';
import 'package:trex_home_page/screens/home/settings/running/running_table.dart';

class StoppedScreen extends StatefulWidget {
  const StoppedScreen({Key? key}) : super(key: key);

  @override
  _StoppedScreenState createState() => _StoppedScreenState();
}

class _StoppedScreenState extends State<StoppedScreen>
    with SingleTickerProviderStateMixin {
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
        centerTitle: true,
        title: const Text(
          "STOPPED",
          style: TextStyle(
            color: Color(0xffF9F7F7),
          ),
        ),
        //toolbarHeight: screenSize.height * 0.02,
        backgroundColor: const Color(0xff0F4C75),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: screenSize.height * 0.02,
            backgroundColor: const Color(0xffF9F7F7),
            bottom: TabBar(
              labelColor: Colors.red,
              controller: _tabController,
              indicatorColor: const Color(0xff0F4C75),
              isScrollable: true,
              tabs: [
                Container(
                  padding: EdgeInsets.only(bottom: screenHeigth * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Table View",
                        style: TextStyle(
                          color: Color(0xff0F4C75),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  width: screenWidth * 0.4,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: screenHeigth * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Card View",
                        style: TextStyle(
                          color: Color(0xff0F4C75),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  width: screenWidth * 0.4,
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              RunningTable(),
              RunningCard(),
            ],
          ),
        ),
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
