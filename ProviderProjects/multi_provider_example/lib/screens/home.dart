// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:multi_provider_example/widgets/counter.dart';
import 'package:multi_provider_example/widgets/user.dart';
import 'package:provider/provider.dart';

import 'counter_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: builderBody(),
    );
  }

  Widget builderBody() {
    return Center(
      child: FlatButton(
          color: Colors.amberAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MultiProvider(providers: [
                          ChangeNotifierProvider<CounterModel>(
                            create: (context) => CounterModel(0),
                          ),
                          ChangeNotifierProvider<UserModel>(
                            create: (context) => UserModel(),
                          ),
                        ], child: const CounterSceeen())));
          },
          child: const Text("Counter Text")),
    );
  }
}
