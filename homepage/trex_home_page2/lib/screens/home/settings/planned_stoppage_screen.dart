import 'package:flutter/material.dart';

class PlannedStoppageScreen extends StatefulWidget {
  const PlannedStoppageScreen({Key? key}) : super(key: key);

  @override
  _PlannedStoppageScreenState createState() => _PlannedStoppageScreenState();
}

class _PlannedStoppageScreenState extends State<PlannedStoppageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "PLANNED STOPPAGE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(child: const Text("PLANNED STOPPAGE")),
      ),
    );
  }
}
