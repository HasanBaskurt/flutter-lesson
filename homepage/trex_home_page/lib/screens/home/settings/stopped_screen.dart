import 'package:flutter/material.dart';

class StoppedScreen extends StatefulWidget {
  const StoppedScreen({Key? key}) : super(key: key);

  @override
  _StoppedScreenState createState() => _StoppedScreenState();
}

class _StoppedScreenState extends State<StoppedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "STOPPED",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(child: Text("STOPPED")),
      ),
    );
  }
}
