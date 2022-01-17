import 'package:flutter/material.dart';

import 'package:trex_home_page/screens/home/settings/card_view.dart';
class NoShiftCard extends StatefulWidget {
  const NoShiftCard({Key? key}) : super(key: key);

  @override
  _PoLoadedCardState createState() => _PoLoadedCardState();
}

class _PoLoadedCardState extends State<NoShiftCard> {
  @override
  Widget build(BuildContext context) {
    return const CardView();
  }
}
