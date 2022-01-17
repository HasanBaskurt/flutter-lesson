
import 'package:etrade_project/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ETradeApp());

class ETradeApp extends StatelessWidget {
  const ETradeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
