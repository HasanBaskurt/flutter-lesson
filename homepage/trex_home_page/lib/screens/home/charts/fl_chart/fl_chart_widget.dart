import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'fl_chart_model.dart';

List<PieChartSectionData> getSections() => FlPieChartData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      //final isTouched = index == touchedIndex;
      final double fontSize = 16;
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: '${data.percent}',
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      );
      return MapEntry(index, value);
    })
    .values
    .toList();
