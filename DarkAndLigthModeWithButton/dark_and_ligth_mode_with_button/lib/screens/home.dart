import 'package:dark_and_ligth_mode_with_button/provider/theme_provider.dart';
import 'package:dark_and_ligth_mode_with_button/widget/change_theme_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'Dark Theme'
        : 'Ligth Theme';
    // ignore: unused_local_variable
    final color1 =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? const Color(0xffF9F7F7)
            : const Color(0xff0F4C75);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Theme Mode",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const ChangeThemeButtonWidget(),
            Text(
              text,
              style: TextStyle(
                  fontSize: 50, color: Theme.of(context).backgroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
