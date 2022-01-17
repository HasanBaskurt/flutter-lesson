import 'package:flutter/material.dart';

import '../table_view.dart';

class PoWaitingTable extends StatefulWidget {
  const PoWaitingTable({Key? key}) : super(key: key);

  @override
  _PoWaitingTableState createState() => _PoWaitingTableState();
}

class _PoWaitingTableState extends State<PoWaitingTable> {
  @override
  Widget build(BuildContext context) {
    return const TableView();
  }
}
