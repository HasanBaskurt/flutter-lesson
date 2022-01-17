import 'package:e_commerce_poject/screens/product_detail.dart';
import 'package:e_commerce_poject/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL: (BuildContext context) => const ProductDetail(),
  };
}
