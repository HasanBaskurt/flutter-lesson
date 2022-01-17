import 'package:dark_and_ligth_mode_with_button/provider/theme_provider.dart';
import 'package:dark_and_ligth_mode_with_button/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyThemes.ligthTheme,
            darkTheme: MyThemes.darkTheme,
            home: const HomePage(),
          );
        },
      );
}
