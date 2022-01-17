import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/screens/home/charts/donutchart.dart';
import 'package:trex_home_page/screens/home/charts/fl_chart/fl_chart.dart';
import 'package:trex_home_page/screens/home/charts/linecard_container.dart';
import 'package:trex_home_page/screens/home/charts/linechart1.dart';
import 'package:trex_home_page/screens/home/charts/barchart.dart';

class ReportsScreen extends StatefulWidget {
  ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final List<charts.Series<Task, String>> _seriesPieData = [];
  _genereteData() {
    var pieData = [
      Task('Planned Stops', 25, Colors.yellow),
      Task('Unplanned Stops', 30, Colors.green),
      Task('Net Worktime', 25, Colors.blue),
      Task('Denek', 15, Colors.red),
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
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color.fromRGBO(193, 214, 233, 1),
          ),
          padding: EdgeInsets.only(
              bottom: screenHeigth * 0.1, top: screenHeigth * 0.02),
          child: Column(
            children: const [
              ShowDonutChart(),
              ShowBarChart(),
              // ShowFlChartScreen(),
              ShowLineCardContainer(),
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
