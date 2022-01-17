import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase_project/utilities/constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";
  String password = "";
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Future<void> userRegistor() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(t1.text)
          .set({'email': t1.text, 'password': t2.text});
    });
  }

  Future<void> userLogin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.of(context).pushNamed(Constants.ROUTE_PROFILE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "User Login",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                backgroundColor: Colors.black,
                leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ))),
            body: Container(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: t1,
                      ),
                      TextFormField(
                        controller: t2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.greenAccent,
                            onPressed: () {
                              setState(() {
                                if (t1.text != null && t2.text != null) {
                                  if (t1.text.length > 5) {
                                    email = t1.text;
                                    password = t2.text;
                                    userLogin();
                                  }
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Login",
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
                                if (t1.text != null && t2.text != null) {
                                  if (t1.text.length > 5) {
                                    email = t1.text;
                                    password = t2.text;
                                    userRegistor();
                                  }
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_add_alt_1,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}

void surveyAdd() {}

void surveyUpdate() {}

void surveyList() {}

void surveyDelete() {}
