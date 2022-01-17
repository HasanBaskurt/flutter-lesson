import 'package:flutter/material.dart';

import '../table_view.dart';

class StoppageTable extends StatefulWidget {
  const StoppageTable({Key? key}) : super(key: key);

  @override
  _StoppageTableState createState() => _StoppageTableState();
}

class _StoppageTableState extends State<StoppageTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
