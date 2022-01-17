import 'package:flutter/material.dart';
import 'package:future_provider_project/apis/trexdcas_api.dart';
import 'package:future_provider_project/models/config_info.dart';
import 'package:future_provider_project/models/connection_data.dart';
import 'package:future_provider_project/models/plant_info.dart';
import 'package:future_provider_project/models/token_data.dart';
import 'package:future_provider_project/screen/trexdcas_login_page.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConnectionPageState();
}

class ConnectionPageState extends State<ConnectionPage> {
  final connectionData = ConnectionData();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size screenSize = MediaQuery.of(context).size;
    final double screenHeigth = screenSize.height;
    // ignore: unused_local_variable
    final double screenWidth = screenSize.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.05),
                      connectionNameField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.05),
                      webServiceAdressField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.05),
                      apiKeyField(),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.05),
                      loginButton(screenHeigth),
                      SizedBox(height: ((screenHeigth * 0.70) * 0.75) * 0.05),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget connectionNameField() {
    return Card(
      color: Colors.grey[350],
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Connection Name",
            prefixIcon: Icon(Icons.podcasts),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your connection name";
          }
        },
        onSaved: (value) {
          connectionData.connectionName = value!;
        },
      ),
    );
  }

  Widget webServiceAdressField() {
    return Card(
      color: Colors.grey[350],
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Web Service Adress",
            prefixIcon: Icon(Icons.vpn_lock_rounded),
            border: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your web service adress";
          }
        },
        onSaved: (value) {
          connectionData.webServiceAdress = value!;
        },
      ),
    );
  }

  Widget apiKeyField() {
    // ignore: avoid_unnecessary_containers
    return Card(
      color: Colors.grey[350],
      child: TextFormField(
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
            hintText: "Api Key",
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
            return "Please enter your api key";
          } else {
            return null;
          }
        },
        onSaved: (value) {
          connectionData.apiKey = value!;
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
        //color: Color(0xff0F4C75),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            saveConnection(connectionData);
            getToken();
            /*if (configControl == true) {
                Navigator.push(context,
                    AnimationPageRoute(widget: TrexdcasConnectionPage(configKey)));
              }*/
          }
        },
        child: const Center(
            child: Text(
          "Save",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );

    /**/
  }

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
          // ignore: avoid_print
          print("Token:" + token.success.toString());
          getConfigInfo();
          //print(token.data!.accessToken.toString());
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print("$e");
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
        // ignore: avoid_print
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
          // ignore: avoid_print
          print(plantInfo.data![0].kpiType.toString());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage(configKey,_token.data!.accessToken.toString())));
        } else {
          // ignore: avoid_print
          print("Error: Incorrect api key");
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
