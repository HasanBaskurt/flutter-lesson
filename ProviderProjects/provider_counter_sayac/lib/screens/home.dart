// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_sayac/screens/counter_screen.dart';
import 'package:provider_counter_sayac/widgets/counter.dart';

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
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: builderBody(),
    );
  }

  Widget builderBody() {
    return Center(
      child: FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider<CounterModel>(
                        create: (context) => CounterModel(0),
                        child: const CounterSceeen())));
          },
          child: const Text("Counter Text")),
    );
  }
}
