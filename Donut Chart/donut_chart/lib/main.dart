import 'package:donut_chart/screens/donut_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DonutApp());

class DonutApp extends StatelessWidget {
  const DonutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonutScreen(),
    );
  }
}
