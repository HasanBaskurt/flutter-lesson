import 'package:dark_and_ligth_mode_with_system/provider/theme_provider.dart';
import 'package:dark_and_ligth_mode_with_system/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyThemes.ligthTheme,
      darkTheme: MyThemes.darkTheme,
      home: const HomePage(),
    );
  }
}