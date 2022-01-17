import 'package:flutter/material.dart';

class RunningScreen extends StatefulWidget {
  const RunningScreen({Key? key}) : super(key: key);

  @override
  _RunningScreenState createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Running",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(child: Text("Running")),
      ),
    );
  }
}
