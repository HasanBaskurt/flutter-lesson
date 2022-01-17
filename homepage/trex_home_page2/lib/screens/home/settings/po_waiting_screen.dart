import 'package:flutter/material.dart';

class PoWaitingScreen extends StatefulWidget {
  PoWaitingScreen({Key? key}) : super(key: key);

  @override
  _PoWaitingScreenState createState() => _PoWaitingScreenState();
}

class _PoWaitingScreenState extends State<PoWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "PO WAITING",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(child: Text("PO WAITING")),
      ),
    );
  }
}
