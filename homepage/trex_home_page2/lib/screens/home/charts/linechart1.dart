import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/fake_datas/home/charts/linechart_fakedata.dart';
import 'package:trex_home_page/models/home/charts/linechart_model.dart';

class ShowLineChart1 extends StatefulWidget {
  const ShowLineChart1({Key? key}) : super(key: key);

  @override
  _ShowLineChart1State createState() => _ShowLineChart1State();
}

class _ShowLineChart1State extends State<ShowLineChart1> {
  LineChartFakeData lineChartFakeData = LineChartFakeData();
  @override
  Widget build(BuildContext context) {
    List<charts.Series<LinearSales, int>> series = [
      charts.Series(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.black,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: lineChartFakeData.seriesList,
      )
    ];
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeigth * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "WEEKLY",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ],
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: screenHeigth * 0.02,
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: screenHeigth * 0.25,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white60,
            boxShadow: const [
              BoxShadow(
                  spreadRadius: -9,
                  blurRadius: 17,
                  offset: Offset(-5, -5),
                  color: Colors.blueGrey),
              BoxShadow(
                spreadRadius: -9,
                blurRadius: 10,
                offset: Offset(7, 7),
                color: Colors.blueGrey,
              ),
            ],
          ),
          child: charts.LineChart(
            series,
            animate: true,
            animationDuration: Duration(seconds: 1),
            defaultRenderer: charts.LineRendererConfig(
                includeArea: true, stacked: true, includePoints: true),
          ),
        ),
      ],
    );
  }
}

//Model

