import 'package:flutter/material.dart';
import 'package:future_provider_project/apis/trexdcas_api.dart';
import 'package:future_provider_project/models/lost_time_pie_model.dart';
import 'package:future_provider_project/models/user.dart';
import 'package:future_provider_project/models/user_data.dart';
import 'package:future_provider_project/screen/lost_time_pie_chart_screen.dart';
import 'package:provider/provider.dart';

late String _connectionKey;
late String _token;

class LoginPage extends StatefulWidget {
  LoginPage(String connectionKey, String token, {Key? key}) : super(key: key) {
    _connectionKey = connectionKey;
    _token = token;
  }

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final user = User();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  late LostTimePie _lostTimePie = LostTimePie();
  UserData _userData = UserData();
  //bool userController = false;

  void userControl(User user) {
    TrexApi.postUser(user.userName.toString(), user.password.toString(),
            user.WebUser.toString(), _connectionKey)
        .then((users) {
      setState(() async {
        _userData = users;
        if (_userData.success == true) {
          await getLostTimePie();
          // ignore: avoid_print
          print("User connection : " + _userData.success.toString());
          // ignore: avoid_print
          print("User token : " + _token);

          // Navigator.pushNamed(context, Constants.ROUTE_HOME_PAGE);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Provider<LostTimePie>(
                      create: (context) => _lostTimePie,
                      child: const LostTimePieChartScreen())));
        } else {
          // ignore: avoid_print
          print("Error : User not found");
        }
      });
    });
  }

  // ignore: unused_field
  Future<void> getLostTimePie() async {
    try {
      await TrexApi.getLostTimePie(
              _token, _userData.data!.id.toString(), _connectionKey)
          .then((LostTimePieValue) {
        setState(() {
          _lostTimePie = LostTimePieValue;
          // ignore: avoid_print
          print("LostTimePie11:" + LostTimePieValue.success.toString());
          //print(LostTimePie.data!.accessLostTimePie.toString());
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size screenSize = MediaQuery.of(context).size;
    final double screenHeigth = screenSize.height;
    // ignore: unused_local_variable
    final double screenWidth = screenSize.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: builderBody(screenHeigth, screenWidth));
  }

  Widget builderBody(screenHeigth, screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        /*gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xff0F4C75),
            Color(0xff3282B8),
          ])*/
      ),
      child: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.08,
            right: screenWidth * 0.08,
            top: screenHeigth * 0.03),
        margin: EdgeInsets.only(
          top: screenHeigth * 0.2,
        ),
        decoration: const BoxDecoration(
          color: Color(0xffF9F7F7),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            const Image(
              image: AssetImage('images/Trex_dcas_logo.jpg'),
              fit: BoxFit.contain,
              width: 250,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.08),
                  userNameField(),
                  SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                  passwordField(),
                  SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                  loginButton(screenHeigth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userNameField() {
    return Card(
      color: Colors.grey[350],
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "User Name",
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your user name";
          }
        },
        onSaved: (value) {
          user.userName = value!;
        },
      ),
    );
  }

  Widget passwordField() {
    // ignore: avoid_unnecessary_containers
    return Card(
      color: Colors.grey[350],
      child: TextFormField(
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
            hintText: "Password",
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock),
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
        onSaved: (value) {
          user.password = value!;
        },
      ),
    );
  }

  Widget loginButton(screenHeigth) {
    // ignore: deprecated_member_use, avoid_unnecessary_containers
    return Card(
      color: Theme.of(context).bottomAppBarColor,
      // ignore: deprecated_member_use
      child: FlatButton(
        height: ((screenHeigth * 0.75) * 0.2) * 0.4,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            userControl(user);
          }
        },
        child: const Center(
            child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );

    /**/
  }
}
