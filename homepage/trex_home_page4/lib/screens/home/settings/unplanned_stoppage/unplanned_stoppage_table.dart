import 'package:flutter/material.dart';

import '../table_view.dart';

class UnplannedStoppageTable extends StatefulWidget {
  const UnplannedStoppageTable({Key? key}) : super(key: key);

  @override
  _UnplannedStoppageTableState createState() => _UnplannedStoppageTableState();
}

class _UnplannedStoppageTableState extends State<UnplannedStoppageTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
