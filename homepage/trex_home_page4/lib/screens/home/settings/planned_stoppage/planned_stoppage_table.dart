import 'package:flutter/material.dart';

import '../table_view.dart';

class PlannedStoppageTable extends StatefulWidget {
  const PlannedStoppageTable({Key? key}) : super(key: key);

  @override
  _PlannedStoppageTableState createState() => _PlannedStoppageTableState();
}

class _PlannedStoppageTableState extends State<PlannedStoppageTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
