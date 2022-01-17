import 'package:drawer_project/screens/customer_screen.dart';
import 'package:drawer_project/screens/home_page.dart';
import 'package:drawer_project/screens/product_screen.dart';
import 'package:drawer_project/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_COSTUMER_SCREEN: (BuildContext context) => const CustomerScreen(),
    Constants.ROUTE_PRODUCT_SCREEN: (BuildContext context) => const ProductScreen(),
    Constants.ROUTE_HOME_SCREEN: (BuildContext context) => const HomePage(),
  };
}
