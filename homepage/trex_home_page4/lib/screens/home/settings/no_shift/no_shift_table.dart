import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/settings/table_view.dart';

class NoShiftTable extends StatefulWidget {
  const NoShiftTable({Key? key}) : super(key: key);

  @override
  _NoShiftTableState createState() => _NoShiftTableState();
}

class _NoShiftTableState extends State<NoShiftTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
