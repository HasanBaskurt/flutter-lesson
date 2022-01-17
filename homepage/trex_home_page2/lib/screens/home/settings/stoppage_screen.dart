import 'package:flutter/material.dart';

class StoppageScreen extends StatefulWidget {
  const StoppageScreen({Key? key}) : super(key: key);

  @override
  _StoppageScreenState createState() => _StoppageScreenState();
}

class _StoppageScreenState extends State<StoppageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "STOPPAGE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(child: Text("STOPPAGE")),
      ),
    );
  }
}
