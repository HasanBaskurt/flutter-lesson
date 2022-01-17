import 'package:flutter/material.dart';
import 'package:form_project/screens/customer_add.dart';

void main() => runApp(const FormApp());

class FormApp extends StatelessWidget {
  const FormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomerAdd(),
    );
  }
}
