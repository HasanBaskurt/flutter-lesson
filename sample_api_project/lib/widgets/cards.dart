import 'package:flutter/material.dart';

Widget createCard(String _leading, String _title, BuildContext context) {
  return Card(
      color: Colors.white.withOpacity(0.7),
      shadowColor: Colors.orange,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        leading: Text(
          _leading,
          style: TextStyle(
            color: Colors.orange.shade900,
            fontSize: 20,
          ),
        ),
        title: Text(
          _title,
          style: const TextStyle(color: Colors.black87, fontSize: 23),
        ),
      ));
}
