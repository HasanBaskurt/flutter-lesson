import 'package:drawer_project/screens/customer_screen.dart';
import 'package:drawer_project/screens/home_page.dart';
import 'package:drawer_project/screens/product_screen.dart';
import 'package:drawer_project/utilities/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(DrawerApp());

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}
