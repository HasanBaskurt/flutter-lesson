import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/charts/linechart1.dart';
import 'package:trex_home_page/screens/home/charts/linechart2.dart';

class ShowLineCardContainer extends StatefulWidget {
  const ShowLineCardContainer({Key? key}) : super(key: key);

  @override
  _ShowLineCardContainerState createState() => _ShowLineCardContainerState();
}

class _ShowLineCardContainerState extends State<ShowLineCardContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: 2, initialIndex: 0, vsync: this);
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Container(
      width: screenWidth * 0.95,
      height: screenHeigth * 0.35,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('images/backgroundd.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(193, 214, 233, 1),
        boxShadow: const [
          BoxShadow(
              spreadRadius: -6,
              blurRadius: 17,
              offset: Offset(-5, -5),
              color: Colors.blueGrey),
          BoxShadow(
            spreadRadius: -6,
            blurRadius: 10,
            offset: Offset(7, 7),
            color: Colors.blueGrey,
          ),
        ],
      ),
      child: DefaultTabController(
          length: 2,
          child: Stack(children: [
            TabBarView(
              controller: tabController,
              children: const [ShowLineChart1(), ShowLineChart2()],
            ),
            Container(
              alignment: FractionalOffset(0.5, 1),
              child: TabPageSelector(
                controller: tabController,
                color: Colors.black12,
                selectedColor: Colors.white,
              ),
            ),
          ])),
    );
  }
}

//Model

