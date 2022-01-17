import 'package:flutter/material.dart';

class PoLoadedScreen extends StatefulWidget {
  PoLoadedScreen({Key? key}) : super(key: key);

  @override
  _PoLoadedScreenState createState() => _PoLoadedScreenState();
}

class _PoLoadedScreenState extends State<PoLoadedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "PO LOADED",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(child: Text("PO LOADED")),
      ),
    );
  }
}
