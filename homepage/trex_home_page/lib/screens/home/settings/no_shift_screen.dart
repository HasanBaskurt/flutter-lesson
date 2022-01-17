import 'package:flutter/material.dart';

class NoShiftScreen extends StatefulWidget {
  const NoShiftScreen({Key? key}) : super(key: key);

  @override
  _NoShiftScreenState createState() => _NoShiftScreenState();
}

class _NoShiftScreenState extends State<NoShiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "NO SHIFT",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(child: const Text("NO SHIFT")),
      ),
    );
  }
}
