import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'Dark Theme'
        : 'Ligth Theme';
    final color1 = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? const Color(0xffF9F7F7)
        : const Color(0xff0F4C75);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Mode"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 50, color: color1),
        ),
      ),
    );
  }
}
