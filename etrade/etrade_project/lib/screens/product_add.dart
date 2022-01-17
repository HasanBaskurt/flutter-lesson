import 'package:etrade_project/db/db_helper.dart';
import 'package:etrade_project/models/product.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductAAddState();
}

class ProductAAddState extends State<ProductAdd> {
  DbHelper dbHelper = DbHelper();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Add A New Product"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: txtDescription,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: txtPrice,
              decoration: InputDecoration(labelText: "Price"),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Save"),
              onPressed: () {
                productAdd();
              },
            ),
          ],
        ),
      ),
    );
  }

  void productAdd() async {
    await dbHelper.insert(Product(
        txtName.text, txtDescription.text, int.tryParse(txtPrice.text)));
    Navigator.pop(context, true);
  }
}
