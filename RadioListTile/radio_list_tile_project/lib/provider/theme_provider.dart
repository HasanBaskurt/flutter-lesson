import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.system;

  void toggleTheme(Object value) {
    switch (value) {
      case 1:
        themeMode = ThemeMode.light;
        break;
      case 2:
        themeMode = ThemeMode.dark;
        break;
      case 3:
        themeMode = ThemeMode.system;
        break;
    }
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
