import 'package:flutter/material.dart';
import 'package:sample_api_project/screens/movie_character_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Breaking Bad App',
        /*theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xFF67e6dc),
            secondaryHeaderColor: Color(0xFF222f3e),
            backgroundColor: Color(0xFFfc5c65)),*/
        home: MovieCharacters());
  }
}
