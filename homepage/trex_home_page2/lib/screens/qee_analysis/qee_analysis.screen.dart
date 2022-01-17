import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/screens/home/charts/barchart_qee.dart';

class QueAnalysisScreen extends StatefulWidget {
  const QueAnalysisScreen({Key? key}) : super(key: key);

  @override
  _QueAnalysisScreenState createState() => _QueAnalysisScreenState();
}

class _QueAnalysisScreenState extends State<QueAnalysisScreen> {
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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(193, 214, 233, 1),
        centerTitle: true,
        title: const Text(
          "QEE ANALYSIS",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [ShowBarChartQee()],
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
