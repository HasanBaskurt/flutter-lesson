import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

//Theme design setting
class MyThemes {
  static final ligthTheme = ThemeData(
    //scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    backgroundColor: const Color(0xff0F4C75),
  );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark(),
      backgroundColor: const Color(0xffF9F7F7));
}
