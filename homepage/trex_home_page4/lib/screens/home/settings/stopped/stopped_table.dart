import 'package:flutter/material.dart';

import '../table_view.dart';

class StoppedTable extends StatefulWidget {
  const StoppedTable({Key? key}) : super(key: key);

  @override
  _StoppedTableState createState() => _StoppedTableState();
}

class _StoppedTableState extends State<StoppedTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
