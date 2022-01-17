import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int tap = 0, doubleTap = 0, longPress = 0;
  double xPosition = 0.0, yPosition = 0.0, boxSize = 0, fullBoxSize = 150;
  late AnimationController controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation!.addListener(() {
      setState(() {
        boxSize = fullBoxSize * animation!.value.toDouble();
      });
      centerBox(context);
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (xPosition == 0) {
      centerBox(context);
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Demo"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: gestureWidget(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap : $tap   Double Tap : $doubleTap   Long Press : $longPress ",
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    ));
  }

  Widget gestureWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tap++;
        });
      },
      onDoubleTap: () {
        setState(() {
          doubleTap++;
        });
      },
      onLongPress: () {
        setState(() {
          longPress++;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails value) {
        setState(() {
          double deltaY = value.delta.dy;
          yPosition += deltaY;
        });
      },
      onHorizontalDragUpdate: (DragUpdateDetails value) {
        setState(() {
          double deltaX = value.delta.dx;
          xPosition += deltaX;
        });
      },
      child: Stack(
        children: [
          Positioned(
            left: xPosition,
            top: yPosition,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: const BoxDecoration(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  void centerBox(BuildContext context) {
    var x = (MediaQuery.of(context).size.width / 2) - (boxSize / 2);
    var y = (MediaQuery.of(context).size.height / 2) - (boxSize / 2) - 30;
    setState(() {
      xPosition = x;
      yPosition = y;
    });
  }
}
