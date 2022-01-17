import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SurveyState();
}

class SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Survey",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.black,
          leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.file_copy,
                color: Colors.orange,
              ))),
      body: _buildSurveyBody(),
    );
  }

  _buildSurveyBody() {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Start"),
          ],
        ),
      ),
    );
  }
}
