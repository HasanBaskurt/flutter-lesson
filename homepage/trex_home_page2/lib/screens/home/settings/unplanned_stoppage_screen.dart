import 'package:flutter/material.dart';

class UnplannedStoppageScreen extends StatefulWidget {
  const UnplannedStoppageScreen({Key? key}) : super(key: key);

  @override
  _UnplannedStoppageScreenState createState() =>
      _UnplannedStoppageScreenState();
}

class _UnplannedStoppageScreenState extends State<UnplannedStoppageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "UNPLANNED STOPPAGE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(child: Text("UNPLANNED STOPPAGE")),
      ),
    );
  }
}
