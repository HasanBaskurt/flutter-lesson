import 'package:donut_chart/models/donut_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DonutScreen extends StatefulWidget {
  const DonutScreen({Key? key}) : super(key: key);

  @override
  _DonutScreenState createState() => _DonutScreenState();
}

class _DonutScreenState extends State<DonutScreen> {
  List<charts.Series<Donut, int>> seriesList = [];

  // ignore: unused_element
  _createSampleData() {
    final data = [
      Donut(0, 100),
      Donut(1, 75),
      Donut(2, 25),
      Donut(3, 5),
    ];

    seriesList.add(charts.Series<Donut, int>(
      id: 'Sales',
      domainFn: (Donut sales, _) => sales.year,
      measureFn: (Donut sales, _) => sales.sales,
      data: data,
      // Set a label accessor to control the text of the arc label.
      labelAccessorFn: (Donut row, _) => '${row.year}: ${row.sales}',
    ));
  }

  @override
  void initState() {
    _createSampleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<int>(
      seriesList,
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 60,
          arcRendererDecorators: [charts.ArcLabelDecorator()]),
      behaviors: [
        charts.DatumLegend(
          position: charts.BehaviorPosition.end,
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: false,
          desiredMaxRows: 2,
          cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
          entryTextStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.purple.shadeDefault,
              fontFamily: 'Georgia',
              fontSize: 11),
        )
      ],
    );
  }
}
