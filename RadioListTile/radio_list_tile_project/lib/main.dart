import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_list_tile_project/provider/theme_provider.dart';
import 'package:radio_list_tile_project/screens/selectionScreen.dart';

void main() => runApp(MyApp());

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
            home: SelectionScreen(),
          );
        },
      );
}
