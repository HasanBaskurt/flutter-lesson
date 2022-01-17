import 'package:flutter/material.dart';

void main() {
  runApp(helloFlutter());
}

class helloFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2c2c2c),
          shadowColor: Colors.red,
          title: Text(
            "Hello Flutter",
            style: TextStyle(color: Colors.orange, fontSize: 25.0),
          ),
          centerTitle: true,
        ),
        body: hiBro(),
      ),
    );
  }
}

class hiBro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          color: Color(0xff2c2c2c),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 205.7,
                        height: 357.7,
                        color: Colors.black,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 41),
                                  width: 41,
                                  height: 357.7,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 41),
                                  width: 41,
                                  height: 357.7,
                                  color: Colors.red,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 205.7,
                        height: 357.7,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 205.7,
                                    height: 30,
                                    color: Color(0xff2c2c2c),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "BUTTON",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 205.7,
                                  height: 327.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [HelloWorldButton()],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 205.7,
                        height: 357.7,
                        color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "HASAN",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              "BAŞKURT",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 205.7,
                        height: 357.7,
                        color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StudentDialogBox(),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HelloWorldButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          "Hello World",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print("Hello World");
        },
      ),
    );
    return button;
  }
}

class StudentDialogBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StudentDialogBoxState();
}

class StudentDialogBoxState extends State<StudentDialogBox> {
  String studentName = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (String nameToChange) {
            setState(() {
              studentName = nameToChange;
            });
          },
        ),
        Text(
          "Hello " + studentName,
          style: TextStyle(color: Colors.orange, fontSize: 20.0),
        )
      ],
    );
  }
}
