import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ShowBarChartQee extends StatefulWidget {
  const ShowBarChartQee({Key? key}) : super(key: key);

  @override
  _ShowBarChartState createState() => _ShowBarChartState();
}

class _ShowBarChartState extends State<ShowBarChartQee> {
  final List<charts.Series<Task, String>> _seriesPieData = [];
  _genereteData() {
    var pieData = [
      Task('A', 14, Colors.yellow),
      Task('P', 35, Colors.green),
      Task('Q', 100, Colors.blue),
      Task('QEE', 54, const Color(0xffD72323)),
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
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffDBE2EF),
        boxShadow: const [
          BoxShadow(
              spreadRadius: -4,
              blurRadius: 2,
              offset: Offset(0.5, -0.5),
              color: Colors.blueGrey),
          BoxShadow(
            spreadRadius: -4,
            blurRadius: 10,
            offset: Offset(-0.5, 0.5),
            color: Colors.blueGrey,
          ),
        ],
      ),
      width: screenWidth * 0.95,
      height: screenHeigth * 0.60,
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
              color: charts.MaterialPalette.black,
              fontSize: 18,
            ),
            legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          ),
        ],
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
