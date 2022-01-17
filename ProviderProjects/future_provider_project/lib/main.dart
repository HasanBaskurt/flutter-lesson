import 'package:flutter/material.dart';
import 'package:future_provider_project/screen/trexdcas_connection_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConnectionPage(),
    );
  }
}
