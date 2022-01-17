import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_list_tile_project/provider/theme_provider.dart';

class SelectionScreen extends StatefulWidget {
  SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  Object? radioValue = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Mode"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTileWidget("Ligth", 1),
          RadioListTileWidget("Dark", 2),
          RadioListTileWidget("System Default", 3),
        ],
      ),
    );
  }

  Widget RadioListTileWidget(String title, int getValue) {
    return RadioListTile(
        title: Text(title),
        value: getValue,
        groupValue: radioValue,
        onChanged: (value) {
          setState(() {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value!);
            radioValue = value;
          });
        });
  }
}
