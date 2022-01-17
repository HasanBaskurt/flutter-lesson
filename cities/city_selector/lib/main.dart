import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CitySelector(),
    );
  }
}

class CitySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CitySelectorState();
}

class CitySelectorState extends State<CitySelector> {
  var cities = ["New York", "Berlin", "Paris"];
  late var selectionCity = cities[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Selection App"),
      ),
      body: Container(
        child: Column(
          children: [
            DropdownButton<String>(
              items: cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              value: selectionCity,
              onChanged: (value) {
                setState(() {
                  selectionCity = value.toString();
                });
              },
            ),
            Text(" Selected city : " + selectionCity)
          ],
        ),
      ),
    );
  }
}
