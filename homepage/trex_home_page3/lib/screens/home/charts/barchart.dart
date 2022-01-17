import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/models/home/charts/barchart_model.dart';

class ShowBarChart extends StatefulWidget {
  const ShowBarChart({Key? key}) : super(key: key);

  @override
  _ShowBarChartState createState() => _ShowBarChartState();
}

class _ShowBarChartState extends State<ShowBarChart> {
  final List<charts.Series<Task, String>> _seriesPieData = [];
  _genereteData() {
    var pieData = [
      Task('A', 4, Colors.yellow),
      Task('P', 7, Colors.green),
      Task('Q', 14, Colors.blue),
      Task('QEE', 9, Colors.red),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorValue),
        id: 'Daily Task',
        labelAccessorFn: (Task row, _) => '${row.taskValue}',
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
        /* image: const DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),*/
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff3282B8),
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
              color: Colors.blueGrey),
        ],
      ),
      width: screenWidth * 0.95,
      height: screenHeigth * 0.35,
      child: Center(
        child: charts.BarChart(
          _seriesPieData,
          animate: true,
          animationDuration: const Duration(seconds: 1),
          barRendererDecorator: charts.BarLabelDecorator<String>(),
          behaviors: [
            charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              horizontalFirst: true,
              cellPadding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
              showMeasures: false,
              entryTextStyle: const charts.TextStyleSpec(
                color: charts.MaterialPalette.white,
                fontSize: 18,
              ),
              legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
            ),
          ],
        ),
      ),
    );
  }
}
