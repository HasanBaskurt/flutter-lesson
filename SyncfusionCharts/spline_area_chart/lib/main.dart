import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<GDPData> _chartData;
  late List<GDPData> _chartData2;
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  @override
  void initState() {
    _chartData = getChartData();
    _chartData2 = getChartData2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Spline Area Chart"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black38,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <ChartSeries>[
            SplineAreaSeries<GDPData, int>(
              borderWidth: 2,
              borderColor: Colors.orangeAccent,
              color: Colors.orangeAccent.withOpacity(0.9),
              name: "chart data 2",
              dataSource: _chartData2,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
              ),
              enableTooltip: true,
            ),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(1, 24),
      GDPData(2, 16),
      GDPData(3, 5),
      GDPData(4, 10),
      GDPData(5, 15),
      GDPData(6, 30),
    ];
    return chartData;
  }

  List<GDPData> getChartData2() {
    final List<GDPData> chartData2 = [
      GDPData(1, 14),
      GDPData(2, 29),
      GDPData(3, 10),
      GDPData(4, 16),
      GDPData(5, 11),
      GDPData(6, 20),
    ];
    return chartData2;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final int continent;
  final int gdp;
}
