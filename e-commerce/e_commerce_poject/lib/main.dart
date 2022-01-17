import 'package:e_commerce_poject/screens/product_list.dart';
import 'package:e_commerce_poject/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ECommerceApp());

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductList(),
      routes: Routes.routes,
    );
  }
}
