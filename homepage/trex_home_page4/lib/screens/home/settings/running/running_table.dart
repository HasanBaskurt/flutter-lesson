import 'package:flutter/material.dart';
import 'package:trex_home_page/screens/home/settings/table_view.dart';

class RunningTable extends StatefulWidget {
  const RunningTable({Key? key}) : super(key: key);

  @override
  _RunningTableState createState() => _RunningTableState();
}

class _RunningTableState extends State<RunningTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
