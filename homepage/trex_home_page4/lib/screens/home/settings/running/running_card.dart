import 'package:flutter/material.dart';

import 'package:trex_home_page/screens/home/settings/card_view.dart';

class RunningCard extends StatefulWidget {
  const RunningCard({Key? key}) : super(key: key);

  @override
  _RunningCardState createState() => _RunningCardState();
}

class _RunningCardState extends State<RunningCard> {
  @override
  Widget build(BuildContext context) {
    return const CardView();
  }
}
