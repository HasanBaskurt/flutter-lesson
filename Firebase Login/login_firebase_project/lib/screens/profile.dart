import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase_project/utilities/Constants.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          actions: [
            IconButton(
                onPressed: () {
                  userExit();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.orange,
                ))
          ],
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.file_copy),
            onPressed: () {
              Navigator.of(context).pushNamed(Constants.ROUTE_SURVEY);
            }),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Constants.ROUTE_SURVEY_LIST);
                    },
                    child: Icon(
                      Icons.list,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userExit() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context).pop();
    });
  }
}
