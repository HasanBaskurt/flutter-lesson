import 'package:flutter/material.dart';

import '../card_view.dart';

class StoppedCard extends StatefulWidget {
  const StoppedCard({Key? key}) : super(key: key);

  @override
  _StoppedCardState createState() => _StoppedCardState();
}

class _StoppedCardState extends State<StoppedCard> {
  @override
  Widget build(BuildContext context) {
    return const CardView();
  }
}
