import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SurveyState();
}

class SurveyState extends State<Survey> {
  String name = "";
  String surName = "";
  String password = "";
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: t1,
              ),
              TextField(
                controller: t2,
              ),
              TextField(
                controller: t3,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      setState(() {
                        surveyAdd();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        surveyUpdate();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.update,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(() {
                        surveyDelete();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  setState(() {});
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "List",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text(name + " " + surName),
                subtitle: Text(password),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  surveyAdd() {
    FirebaseFirestore.instance
        .collection("Survey")
        .doc(t1.text)
        .set({'question': t2.text, 'answer': t3.text});
  }

  surveyUpdate() {
    FirebaseFirestore.instance.collection("Survey").doc(t1.text).update({
      'question': t2.text, 'answer': t3.text
      // ignore: avoid_print
    }).whenComplete(() => print("Survey updated."));
  }

  surveyDelete() {
    FirebaseFirestore.instance.collection("Survey").doc(t1.text).delete();
  }

  /*surveyList() {
    FirebaseFirestore.instance
        .collection("Survey")
        .doc("Hasan")
        .get()
        .then((getData) {
      setState(() {
        name = getData.data()!['name'];
        surName = getData.data()!['surname'];
        password = getData.data()!['password'];
      });
    });
  }*/
}
