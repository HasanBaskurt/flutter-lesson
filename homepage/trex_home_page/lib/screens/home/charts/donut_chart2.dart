import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';
import 'package:trex_home_page/models/home/charts/donutchart_model.dart';

class ShowDonutChart2 extends StatefulWidget {
  const ShowDonutChart2({Key? key}) : super(key: key);

  @override
  _ShowDonutChart2State createState() => _ShowDonutChart2State();
}

class _ShowDonutChart2State extends State<ShowDonutChart2> {
  final List<charts.Series<Donut, String>> _seriesPieData = [];
  _genereteData() {
    var pieData = [
      Donut('Planned Stops', 4.78, Colors.green),
      Donut('Unplanned Stops', 7, Colors.yellow),
      Donut('Net Worktime', 14, Colors.blue),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Donut donut, _) => donut.processName,
        measureFn: (Donut donut, _) => donut.processValue,
        colorFn: (Donut donut, _) =>
            charts.ColorUtil.fromDartColor(donut.colorValue),
        id: 'Daily Donut',
        labelAccessorFn: (Donut row, _) => '${row.processValue}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _genereteData();
  }

  Color xColor = Colors.blueGrey.shade800, yColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('images/backgroundd2.jpg'),
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
      child: Column(
        children: [
          // Text("srg"),
          Container(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            width: screenWidth * 0.95,
            height: screenHeigth * 0.35,
            child: Center(
                child: charts.PieChart<String>(
              _seriesPieData,
              animate: true,
              animationDuration: const Duration(seconds: 1),
              behaviors: [
                charts.DatumLegend(
                  position: charts.BehaviorPosition.start,
                  horizontalFirst: false,
                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                  showMeasures: false,
                  entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.white,
                    //fontSize: 18,
                  ),
                  legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                ),
              ],
              defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 40,
                  arcRendererDecorators: [charts.ArcLabelDecorator()]),
            )),
          ),
        ],
      ),
    );
  }
}
