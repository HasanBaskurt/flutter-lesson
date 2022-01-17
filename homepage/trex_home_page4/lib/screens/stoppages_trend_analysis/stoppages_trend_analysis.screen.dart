import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trex_home_page/screens/home/charts/barchart_qee.dart';

class StoppagesTrendAnalysisScreen extends StatefulWidget {
  const StoppagesTrendAnalysisScreen({Key? key}) : super(key: key);

  @override
  _StoppagesTrendAnalysisScreenState createState() =>
      _StoppagesTrendAnalysisScreenState();
}

class _StoppagesTrendAnalysisScreenState
    extends State<StoppagesTrendAnalysisScreen> {
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
        backgroundColor: const Color(0xffF9F7F7),
        centerTitle: true,
        title: const Text(
          "QEE ANALYSIS",
          style: TextStyle(color: Color(0xff0F4C75)),
        ),
      ),
      backgroundColor: const Color(0xffF9F7F7),
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
