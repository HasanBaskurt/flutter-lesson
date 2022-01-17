import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigatorTabbar(),
    );
  }
}

class NavigatorTabbar extends StatefulWidget {
  const NavigatorTabbar({Key? key}) : super(key: key);

  @override
  _NavigatorTabbarState createState() => _NavigatorTabbarState();
}

class _NavigatorTabbarState extends State<NavigatorTabbar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _scrollController.addListener(listenScrolling);
    _tabController = TabController(length: 10, vsync: this, initialIndex: 0);
    super.initState();
  }

  void listenScrolling() {
    if (_scrollController.position.atEdge) {
      const isTop = 0;
      final isEnd = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels == isTop) {
        setState(() {
          opacityValue1 = 0.0;
          opacityValue2 = 1.0;
        });
      } else if (_scrollController.position.pixels == isEnd) {
        setState(() {
          opacityValue1 = 1.0;
          opacityValue2 = 0.0;
        });
      }
    }
    if (_scrollController.position.pixels > 0 &&
        _scrollController.position.pixels <
            _scrollController.position.maxScrollExtent) {
      setState(() {
        opacityValue1 = 1.0;
        opacityValue2 = 1.0;
      });
    }
  }

  final _scrollController = ScrollController();
  late TabController _tabController;
  double opacityValue1 = 0.0;
  double opacityValue2 = 1.0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeigth = screenSize.height;
    // ignore: unused_local_variable
    double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Bottom Navigator Tabbar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          "!",
          style: TextStyle(color: Colors.red, fontSize: 50),
        ),
      ),
      bottomNavigationBar: bottomNavigatorTabbar(screenHeigth),
    );
  }

  bottomNavigatorTabbar(double screenHeigth) {
    return Container(
        height: screenHeigth * 0.1,
        color: Colors.black,
        child: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: TabBar(
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2)),
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: const Color(0xffBBBBBB),
                    labelColor: Colors.orange,
                    isScrollable: true,
                    tabs: const [
                      Icon(
                        Icons.home,
                        size: 30,
                      ),
                      Icon(
                        Icons.add_chart,
                        size: 30,
                      ),
                      Icon(
                        Icons.add_location_alt_rounded,
                        size: 30,
                      ),
                      Icon(
                        Icons.airplane_ticket_sharp,
                        size: 30,
                      ),
                      Icon(
                        Icons.ac_unit,
                        size: 30,
                      ),
                      Icon(
                        Icons.add_to_queue_rounded,
                        size: 30,
                      ),
                      Icon(
                        Icons.adjust_sharp,
                        size: 30,
                      ),
                      Icon(
                        Icons.workspaces_sharp,
                        size: 30,
                      ),
                      Icon(
                        Icons.wifi_tethering_error_rounded,
                        size: 30,
                      ),
                      Icon(
                        Icons.wb_sunny_rounded,
                        size: 30,
                      ),
                    ]),
              ),
              Opacity(
                opacity: opacityValue1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: opacityValue2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
