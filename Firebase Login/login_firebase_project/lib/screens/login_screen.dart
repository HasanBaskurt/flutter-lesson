import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase_project/utilities/Constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _builBody(context),
    );
  }

  _builBody(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/backgroundImage.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(Constants.ROUTE_ADMIN_LOGIN);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        color: Colors.white,
                        size: screenSize.width * 0.40,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Constants.ROUTE_ADMIN_LOGIN);
                          },
                          child: Text(
                            "Admin",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.07),
                          ))
                    ],
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Constants.ROUTE_USER_LOGIN);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: screenSize.width * 0.40,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Constants.ROUTE_USER_LOGIN);
                          },
                          child: Text(
                            "User",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.07),
                          ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
