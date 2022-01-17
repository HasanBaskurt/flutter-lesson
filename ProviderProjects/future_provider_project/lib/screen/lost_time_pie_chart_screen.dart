import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:future_provider_project/models/donut_chart_model.dart';
import 'package:future_provider_project/models/lost_time_pie_model.dart';
import 'package:provider/provider.dart';

class LostTimePieChartScreen extends StatefulWidget {
  const LostTimePieChartScreen({Key? key}) : super(key: key);

  @override
  _LostTimePieChartScreenState createState() => _LostTimePieChartScreenState();
}

class _LostTimePieChartScreenState extends State<LostTimePieChartScreen> {
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
  }

  Color xColor = Colors.blueGrey.shade800, yColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    //List<LostTimePieData>? lostTimePieData=Provider.of<LostTimePie>(context).data;
    var x = Provider.of<LostTimePie>(context).data![0].color.toString();

    _genereteData();
    return Scaffold(
      appBar: AppBar(
        title: Text("$x"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          /*image: const DecorationImage(
              image: AssetImage('images/backgroundd3.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),*/
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor,
        ),
        child: Center(
            child: charts.PieChart<String>(
          _seriesPieData,
          animate: true,
          animationDuration: const Duration(seconds: 1),
          behaviors: [
            charts.DatumLegend(
              entryTextStyle: const charts.TextStyleSpec(
                  color: charts.MaterialPalette.black),
              position: charts.BehaviorPosition.end,
              horizontalFirst: false,
              cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
              showMeasures: false,
              legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
            ),
          ],
          defaultRenderer: charts.ArcRendererConfig(
              arcWidth: 45,
              arcRendererDecorators: [charts.ArcLabelDecorator()]),
        )),
      ),
    );
  }
}