import 'package:flutter/material.dart';

class FlPieChartData {
  static List<FlPieChartModel> data = [
    FlPieChartModel("Blue", 40, Colors.blue),
    FlPieChartModel("Orange", 30, Colors.orange),
    FlPieChartModel("Black", 15, Colors.black),
    FlPieChartModel("Green", 15, Colors.green),
  ];
}

class FlPieChartModel {
  final String name;
  final double percent;
  final Color color;
  FlPieChartModel(this.name, this.percent, this.color);
}
