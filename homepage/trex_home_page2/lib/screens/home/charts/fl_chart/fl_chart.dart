import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'fl_chart_widget.dart';

class ShowFlChartScreen extends StatefulWidget {
  const ShowFlChartScreen({Key? key}) : super(key: key);

  @override
  _ShowFlChartScreenState createState() => _ShowFlChartScreenState();
}

class _ShowFlChartScreenState extends State<ShowFlChartScreen> {
  //late int touchedIndex;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('images/backgroundd3.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(193, 214, 233, 1),
        boxShadow: const [
          BoxShadow(
              spreadRadius: -6,
              blurRadius: 17,
              offset: Offset(0, 0),
              color: Colors.blueGrey),
          BoxShadow(
            spreadRadius: -6,
            blurRadius: 10,
            offset: Offset(0, 0),
            color: Colors.blueGrey,
          ),
        ],
      ),
      width: screenWidth * 0.95,
      height: screenHeigth * 0.35,
      child: Center(
        child: Container(
            color: Colors.transparent,
            width: screenWidth * 0.95,
            height: screenHeigth * 0.35,
            child: Column(
              children: [
                PieChart(
                  PieChartData(
                    /*pieTouchData: PieTouchData(
                touchCallback: (PieTouchResponse){
                  setState(() {
                    if(pieTouchResponse.touchInput is FlLongPressEnd ||
                       pieTouchResponse.touchInput is FlPanEnd ){
                         touchedIndex=-1;
                    }else{
                      touchedIndex=pieTouchResponse.touchedSectionIndex;
                    }
                  });
                },
              ),*/
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 80,
                    centerSpaceColor: Colors.transparent,
                    sections: getSections(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
