import 'dart:ffi';

import 'package:checkbox_project/model/checkbox_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckboxExample(),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({Key? key}) : super(key: key);

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final notifications = [
    CheckboxModel(checkboxTitle: "Ligth"),
    CheckboxModel(checkboxTitle: "Dark"),
    CheckboxModel(checkboxTitle: "System"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Checkbox"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ...notifications.map(buildSingleCheckbox).toList(),
          ],
        ));
  }

  Widget buildSingleCheckbox(CheckboxModel checkboxModel) {
    return CheckboxListTile(
      activeColor: Colors.green,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        checkboxModel.checkboxTitle,
        style: TextStyle(color: Colors.white),
      ),
      value: checkboxModel.checkboxValue,
      onChanged: (_) {
        setState(() {
          checkboxModel.checkboxValue = !checkboxModel.checkboxValue;
        });
      },
    );
  }
}
