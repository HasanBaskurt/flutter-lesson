import 'package:drawer_project/screens/customer_screen.dart';
import 'package:drawer_project/screens/product_screen.dart';
import 'package:drawer_project/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Drawer Project"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Center(
          child: Text("Home Page"),
        ),
      ),
      drawer: buildDrawer(context),
    ));
  }

  createMenuItems(BuildContext context) {
    createNavigationItem(var icon, String pageName, String pageRoute) {
      return ListTile(
          leading: Icon(icon),
          title: Text(pageName),
          onTap: () {
            setState(() {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, pageRoute);
            });
          });
    }

    var navigationList = [
      createNavigationItem(Icons.home, "Home", "/"),
      createNavigationItem(
          Icons.account_circle, "Customer", Constants.ROUTE_COSTUMER_SCREEN),
      createNavigationItem(
          Icons.shop, "Product", Constants.ROUTE_PRODUCT_SCREEN),
    ];

    ListView menuItems = ListView(
      children: navigationList,
    );
    return Drawer(
      child: menuItems,
    );
  }

  buildDrawer(BuildContext context) {
    return Drawer(child: createMenuItems(context));
  }
}
