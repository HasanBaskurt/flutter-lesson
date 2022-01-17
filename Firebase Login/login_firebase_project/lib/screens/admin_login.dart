import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_firebase_project/utilities/Constants.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AdminLoginState();
}

class AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/backgroundImage.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: screenSize.width * 0.05,
                  left: screenSize.width * 0.05),
              decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: SizedBox(
                          width: (screenSize.width * 0.9),
                          height: ((screenSize.height * 0.70) * 0.75),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(
                                    ((screenSize.height * 0.75) * 0.2) * 0.1),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: ((screenSize.height * 0.70) *
                                                  0.75) *
                                              0.1),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.admin_panel_settings,
                                            color: Colors.white,
                                            size: screenSize.width * 0.15,
                                          ),
                                          SizedBox(
                                              width: screenSize.width * 0.06),
                                          Text(
                                            "Admin Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    screenSize.width * 0.1),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: ((screenSize.height * 0.70) *
                                                  0.75) *
                                              0.1),
                                      webServiceAdressField(),
                                      SizedBox(
                                          height: ((screenSize.height * 0.70) *
                                                  0.75) *
                                              0.05),
                                      connectionNameField(),
                                      SizedBox(
                                          height: ((screenSize.height * 0.70) *
                                                  0.75) *
                                              0.05),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          loginButtons(
                                              screenSize,
                                              Icon(Icons.login),
                                              "Login",
                                              Constants.ROUTE_ADMIN_LOGIN,
                                              Colors.green),
                                          loginButtons(
                                              screenSize,
                                              Icon(
                                                  Icons.person_add_alt_1_sharp),
                                              "Register",
                                              Constants.ROUTE_ADMIN_LOGIN,
                                              Colors.blueAccent),
                                        ],
                                      ),
                                      SizedBox(
                                          height: ((screenSize.height * 0.70) *
                                                  0.75) *
                                              0.05),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget webServiceAdressField() {
    return Container(
      //child: Text("fhdsfhfsdh"),
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your email adress";
          }
        },
        onSaved: (value) {
          print(value);
        },
      ),
    );
  }

  Widget connectionNameField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
            hintText: "Password",
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.vpn_key),
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isHiddenPassword = !isHiddenPassword;
                  });
                },
                child: Icon(isHiddenPassword
                    ? Icons.visibility_off
                    : Icons.visibility))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your password";
          } else {
            return null;
          }
        },
        onSaved: (value) {},
      ),
    );
  }

  Widget loginButtons(Size screenSize, Icon icon, String buttonTitle,
      String path, Color buttonColor) {
    // ignore: avoid_unnecessary_containers, deprecated_member_use
    return FlatButton(
      height: ((screenSize.height * 0.75) * 0.2) * 0.3,
      minWidth: ((screenSize.height * 0.75) * 0.2),
      color: buttonColor,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.of(context)
              .pushNamed(Constants.ROUTE_ADMIN_SELECTION_SECREEN);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon.icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(buttonTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.height * 0.20 * 0.1,
              )),
        ],
      ),
    );
  }
}
