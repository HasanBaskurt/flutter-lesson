import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/screens/home.dart';

void main() => runApp(WhatsApp());

class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        // ignore: deprecated_member_use
        accentColor: Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
