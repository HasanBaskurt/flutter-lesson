import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/models/home/charts/donutchart_model.dart';

class ShowDonutChart extends StatefulWidget {
  const ShowDonutChart({Key? key}) : super(key: key);

  @override
  _ShowDonutChartState createState() => _ShowDonutChartState();
}

class _ShowDonutChartState extends State<ShowDonutChart> {
  final List<charts.Series<Donut, String>> _seriesPieData = [];
  _genereteData() {
    var pieData = [
      Donut('Planned Stops', 4.78, Colors.brown),
      Donut('Unplanned Stops', 7, Colors.grey),
      Donut('Net Worktime', 14, Colors.blue),
      Donut('Qee Analysis', 4.78, Colors.yellow),
      Donut('Stoppage Analysis', 7, Colors.green),
      Donut('Po Waiting', 14, Colors.purple),
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
          child: charts.PieChart<String>(
        _seriesPieData,
        animate: true,
        animationDuration: const Duration(seconds: 1),
        behaviors: [
          charts.DatumLegend(
            entryTextStyle:
                charts.TextStyleSpec(color: charts.MaterialPalette.white),
            position: charts.BehaviorPosition.end,
            horizontalFirst: false,
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            showMeasures: false,
            legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          ),
        ],
        defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 45, arcRendererDecorators: [charts.ArcLabelDecorator()]),
      )),
    );
  }
}
