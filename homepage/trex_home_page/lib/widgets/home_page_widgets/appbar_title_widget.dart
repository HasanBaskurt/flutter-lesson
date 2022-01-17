import 'package:flutter/material.dart';

// ignore: unused_element
Widget buildAppBarTitle(Size screenSize, BuildContext context) {
  return Column(
    children: [
      Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'tre',
                    style: TextStyle(
                        color: const Color(0xff01579B),
                        fontSize: ((screenSize.width * 0.75) * 0.2) * 0.61,
                        fontStyle: FontStyle.normal)),
                TextSpan(
                    text: 'x',
                    style: TextStyle(
                        color: const Color(0xff7CB342),
                        fontSize: ((screenSize.width * 0.75) * 0.2) * 0.61)),
                TextSpan(
                    text: 'D',
                    style: TextStyle(
                        color: const Color(0xffFF6F00),
                        fontSize: ((screenSize.width * 0.75) * 0.2) * 0.50)),
                TextSpan(
                    text: 'C',
                    style: TextStyle(
                        color: const Color(0xff7CB342),
                        fontSize: ((screenSize.width * 0.75) * 0.2) * 0.50)),
                TextSpan(
                    text: 'A',
                    style: TextStyle(
                        color: const Color(0xff01579B),
                        fontSize: ((screenSize.width * 0.75) * 0.2) * 0.50)),
                TextSpan(
                    text: 'S',
                    style: TextStyle(
                        color: const Color(0xffFF6F00),
                        fontSize: ((screenSize.width * 0.75) * 0.2) * 0.50)),
              ],
            ),
          ),
        ],
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " Productivity & Production Monitoring Technologies",
            style: TextStyle(
                color: Colors.blue,
                fontSize: ((screenSize.height * 0.75) * 0.1) * 0.09),
          ),
        ],
      ),
    ],
  );
}
