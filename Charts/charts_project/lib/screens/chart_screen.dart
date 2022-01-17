import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

const pal = [0xff2387c, 0xff05c7f2, 0xff04d9c4, 0xfff2b705, 0xfff26241];

class _ChartScreenState extends State<ChartScreen> {
  List<DataItem> dataset = [
    DataItem(0.2, "Comedy", Color(pal[0])),
    DataItem(0.25, "Action", Color(pal[0])),
    DataItem(0.3, "Rpmance", Color(pal[0])),
    DataItem(0.05, "Drama", Color(pal[0])),
    DataItem(0.2, "SciFi", Color(pal[0])),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: const TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.chartPie),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.solidChartBar),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.solidChartBar),
              )
            ]),
            title: Text("FLUTTER CHARTS"),
            centerTitle: true,
          ),
          body: TabBarView(children: [
            Container(
              child: CustomPaint(
                child: Container(),
                painter: DonutChartPainter(dataset),
              ),
            ),
            Text("2"),
            Text("3"),
          ]),
        ));
  }
}

Paint linePaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 2
  ..style = PaintingStyle.stroke;

final midPaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;
const TextFieldTextBigStyle = TextStyle(
  color: Colors.black38,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const labelStyle = TextStyle(
  color: Colors.black,
  fontSize: 12,
);

class DonutChartPainter extends CustomPainter {
  final List<DataItem> dataset;
  DonutChartPainter(this.dataset);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.6;
    final rect = Rect.fromCenter(center: c, width: radius, height: radius);
    double startAngle = 0;
    dataset.forEach((element) {
      final double sweepAngel = element.value * 360 * pi / 180;
      drawSector(canvas, element, rect, startAngle, sweepAngel);
      //draw lines

      startAngle += sweepAngel;
    });
    startAngle = 0;
    dataset.forEach((element) {
      final double sweepAngel = element.value * 360 * pi / 180;
      drawLine(
        canvas,
        c,
        radius,
        startAngle,
      );
      startAngle += sweepAngel;
    });

    startAngle = 0;
    dataset.forEach((element) {
      final double sweepAngel = element.value * 360 * pi / 180;
      drawLabels(canvas, c, radius, sweepAngel, startAngle, element.label);
      startAngle += sweepAngel;
    });

    //draw the middle
    canvas.drawCircle(c, radius * 0.3, midPaint);

    //draw title
    drawTextCentered(canvas, c, "Favourite\nMovie\nGenres",
        TextFieldTextBigStyle, radius * 0.6, (Size sz) {});
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    //elipsis= "...";
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth, Function(Size sz) bgCb) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2, -tp.height / 2);
    bgCb(tp.size);
    tp.paint(canvas, pos);
    return tp.size;
  }

  void drawLine(
    Canvas canvas,
    Offset c,
    double radius,
    double startAngle,
  ) {
    final dx = radius / 2 * cos(startAngle);
    final dy = radius / 2 * sin(startAngle);
    final p2 = c + Offset(dx, dy);
    canvas.drawLine(c, p2, linePaint);
  }

  void drawSector(Canvas canvas, DataItem element, Rect rect, double startAngle,
      double sweepAngel) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = element.colorValue;
    canvas.drawArc(rect, startAngle, sweepAngel, true, paint);
  }

  @override
  bool shouldRepaint(DonutChartPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(DonutChartPainter oldDelegate) => false;

  void drawLabels(Canvas canvas, Offset c, double radius, double sweepAngel,
      double startAngle, String label) {
    final r = radius * 0.4;
    final dx = r * cos(startAngle + sweepAngel / 2);
    final dy = r * sin(startAngle + sweepAngel / 2);
    final position = c + Offset(dx, dy);
    drawTextCentered(canvas, position, label, labelStyle, 100, (Size sz) {
      final rect = Rect.fromCenter(
          center: c + position, width: sz.width + 5, height: sz.height + 5);
      final rrect = RRect.fromRectAndRadius(rect, Radius.circular(5));
      canvas.drawRRect(rrect, midPaint);
    });
  }
}

class DataItem {
  late final double value;
  late final String label;
  late final Color colorValue;

  DataItem(this.value, this.label, this.colorValue);
}
