import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EmailScreenState();
}

class EmailScreenState extends State<EmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff0F4C75),
        title: /*const Icon(
          Icons.email,
          color: Colors.white,
          size: 30,
        ),*/
            const Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff0F4C75),
          /*image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))*/
        ),
        child: Container(
            margin: EdgeInsets.only(
              top: screenHeigth * 0.07,
            ),
            decoration: const BoxDecoration(
              color: Color(0xffF9F7F7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80), topRight: Radius.circular(80)),
            ),
            child:
                // ignore: avoid_unnecessary_containers
                Center(
              child: Container(
                width: (screenWidth * 0.9),
                height: screenHeigth * 0.75,
                padding: EdgeInsets.only(
                    right: (((screenHeigth * 0.75) * 0.2) * 0.2),
                    left: (((screenHeigth * 0.75) * 0.2) * 0.2)),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            " Send Email ",
                            style: TextStyle(
                                color: Color(0xff0F4C75),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.email,
                            color: Color(0xff0F4C75),
                            size: 40,
                          ),
                        ],
                      ),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                      nameField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                      emailField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                      subjectField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                      messageField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                      loginButton(screenHeigth, screenWidth),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.04),
                      /*Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              languageIcon1(),
                                              languageIcon2(),
                                              languageIcon3(),
                                            ],
                                          ),*/
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Widget nameField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Name",
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your name";
          }
        },
        onSaved: (value) {
          // ignore: avoid_print
          print(value.toString());
        },
      ),
    );
  }

  Widget emailField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your email address";
          }
        },
        onSaved: (value) {
          // ignore: avoid_print
          print(value.toString());
        },
      ),
    );
  }

  Widget subjectField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Subject",
            prefixIcon: Icon(Icons.subject),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your subject";
          }
        },
        onSaved: (value) {
          // ignore: avoid_print
          print(value.toString());
        },
      ),
    );
  }

  Widget messageField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        minLines: 5,
        maxLines: 5,
        decoration: const InputDecoration(
            //hintText: "Message",
            prefixIcon: Icon(Icons.message),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your message";
          }
        },
        onSaved: (value) {
          // ignore: avoid_print
          print(value.toString());
        },
      ),
    );
  }

  Widget loginButton(screenHeigth, screenWidth) {
    // ignore: deprecated_member_use, avoid_unnecessary_containers
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),

        // ignore: deprecated_member_use
        child: FlatButton(
          height: ((screenHeigth * 0.75) * 0.2) * 0.4,
          color: const Color(0xff0F4C75),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              //saveConnection(connectionData);
              //getToken();
              /*if (configControl == true) {
                Navigator.push(context,
                    AnimationPageRoute(widget: TrexdcasEmailScreen(configKey)));
              }*/
            }
          },
          child: const Center(
              child: Text(
            "SEND",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

/*
  void saveConnection(ConnectionData connectionData) {
    // ignore: avoid_print
    print("Connection Name: " +
        connectionData.connectionName +
        "  Web Service Adress: " +
        connectionData.webServiceAdress +
        "  Api Key: " +
        connectionData.apiKey);
  }

  late Token _token = Token();
  void getToken() async {
    try {
      await TrexApi.getToken(connectionData.webServiceAdress).then((token) {
        setState(() {
          _token = token;
          print("Token:" + token.success.toString());
          getConfigInfo();
          //print(token.data!.accessToken.toString());
        });
      });
    } catch (e) {
      await showAlert("Incorrect Web Service Address !", context);
    }
  }

  ConfigInfo configInfo = ConfigInfo();
  late String configKey;
  bool configControl = false;
  void getConfigInfo() {
    TrexApi.getConfigInfo(_token.data!.accessToken.toString()).then((cnf) {
      setState(() {
        configInfo = cnf;
        configKey = configInfo.data![0].key!;
        print("Config Key : " + configKey);
        configControl = true;
        getPlantInfo();
        //print(_configInfo.data![0].key.toString());
      });
    });
  }

  PlantInfo plantInfo = PlantInfo();
  void getPlantInfo() {
    TrexApi.getPlantInfo(_token.data!.accessToken.toString(),
            connectionData.apiKey, configKey)
        .then((value) {
      setState(() {
        plantInfo = value;
        if (plantInfo.success == true) {
          print(plantInfo.data![0].kpiType.toString());
          Navigator.push(context,
              AnimationPageRoute(widget: TrexdcasEmailScreen(configKey)));
        } else {
          print("Error: Incorrect api key");
          showAlert("Incorrect api key !", context);
        }
      });
    });
  }
*/
  @override
  void initState() {
    super.initState();
  }
}
