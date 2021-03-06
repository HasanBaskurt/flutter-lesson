import 'package:etrade_project/screens/product_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ETrade Project"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ProductList(),
      ),
    );
  }
}
