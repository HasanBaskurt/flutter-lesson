import 'package:flutter/material.dart';

import '../table_view.dart';

class PoLoadedTable extends StatefulWidget {
  const PoLoadedTable({Key? key}) : super(key: key);

  @override
  _PoLoadedTableState createState() => _PoLoadedTableState();
}

class _PoLoadedTableState extends State<PoLoadedTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
