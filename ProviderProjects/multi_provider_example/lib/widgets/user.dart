import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  final String _name = "Hasan";
  String get name => _name;
}
