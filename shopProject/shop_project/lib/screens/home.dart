
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(50),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                children: const [
                  Text(
                    "Asus Laptop :",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 22, decoration: TextDecoration.none),
                  ),
                  Expanded(
                    child: Text("16 GB RAM",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 22, decoration: TextDecoration.none)),
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.ltr,
                children: const [
                  Text(
                    "Monster Laptop :",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 22, decoration: TextDecoration.none),
                  ),
                  Expanded(
                    child: Text("32 GB RAM",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 22, decoration: TextDecoration.none)),
                  ),
                ],
              ),
              Directionality(
                  textDirection: TextDirection.ltr, child: OrderButton())
            ],
          )),
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chechoutButton = Container(
      // ignore: deprecated_member_use
      margin: EdgeInsets.only(top: 50),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          order(context);
        },
        child: Text("Go to checkout"),
      ),
    );
    return chechoutButton;
  }
}

order(BuildContext context) {
  var alert = const AlertDialog(
    title: Text("Go to checkout"),
    content: Text("I will go to checkout"),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}
