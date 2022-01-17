import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/screens/home/charts/donutchart.dart';
import 'package:trex_home_page/screens/home/charts/linecard_container.dart';
import 'package:trex_home_page/screens/home/charts/barchart.dart';

class ScropeAnalysisScreen extends StatefulWidget {
  const ScropeAnalysisScreen({Key? key}) : super(key: key);

  @override
  _ScropeAnalysisScreenState createState() => _ScropeAnalysisScreenState();
}

class _ScropeAnalysisScreenState extends State<ScropeAnalysisScreen> {
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
          decoration: const BoxDecoration(
            color: Color(0xffF9F7F7),
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
