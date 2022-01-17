import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/screens/chat_screen.dart';
import 'package:whatsapp_project/screens/state_screen.dart';

import 'call_screen.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, initialIndex: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cameraWidth = screenWidth / 24;
    double titleWidth = (screenWidth - cameraWidth) / 5;
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("WhatsApp"),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.symmetric(
              horizontal: (screenWidth - (cameraWidth + titleWidth * 3)) / 8),
          isScrollable: true,
          tabs: [
            Container(
              child: Tab(icon: Icon(Icons.camera_alt)),
              width: cameraWidth,
            ),
            Container(
              child: Tab(
                text: "SOHBETLER",
              ),
              width: titleWidth,
            ),
            Container(
              child: Tab(
                text: "DURUM",
              ),
              width: titleWidth,
            ),
            Container(
              child: Tab(
                text: "ARAMALAR",
              ),
              width: titleWidth,
            )
          ],
        ),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("Camera"),
          Directionality(textDirection: TextDirection.ltr, child: ChatScreen()),
          Directionality(
              textDirection: TextDirection.ltr, child: StateScreen()),
          Directionality(textDirection: TextDirection.ltr, child: CallScreen()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {
          print("hello");
        },
      ),
    );
  }
}
