// ignore_for_file: deprecated_member_use

import 'package:etrade_project/db/db_helper.dart';
import 'package:etrade_project/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);
  @override
  State<StatefulWidget> createState() => ProductDetailState(product);
}

DbHelper dbHelper = DbHelper();
enum Choice { Delete, Update }

class ProductDetailState extends State<ProductDetail> {
  Product product;
  ProductDetailState(this.product);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Product Detail For ${product.getName}"),
        actions: [
          PopupMenuButton<Choice>(
              onSelected: select,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                    PopupMenuItem<Choice>(
                        value: Choice.Update,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Update"),
                            Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )
                          ],
                        )),
                    PopupMenuItem<Choice>(
                        value: Choice.Delete,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Delete"),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            )
                          ],
                        )),
                  ]),
        ],
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.computer,
                  size: 50,
                ),
                title: Text("Name : " + product.getName.toString()),
                subtitle:
                    Text("Price : " + product.getPrice.toString() + " \$"),
              ),
              ButtonTheme(
                  child: ButtonBar(
                children: [
                  FlatButton(
                      onPressed: () {
                        AlertDialog alertDialog = AlertDialog(
                          backgroundColor: Colors.blueGrey,
                          title: Text(
                            "Success",
                            style: TextStyle(color: Colors.green),
                          ),
                          content: Text(
                            "${product.getName} added to basket",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                        showDialog(
                            context: context, builder: (_) => alertDialog);
                      },
                      child: Icon(
                        Icons.shopping_basket,
                        color: Colors.green,
                        size: 35,
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    ));
  }

  void select(Choice choice) async {
    var result;
    switch (choice) {
      case Choice.Delete:
        Navigator.pop(context, true);
        result = await dbHelper.delete(int.parse(product.getId.toString()));
        if (result != 0) {
          AlertDialog alertDialog = AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: Text(
              "Success",
              style: TextStyle(color: Colors.green),
            ),
            content: Text(
              "Delete product: ${product.getName.toString()} / ${product.getId.toString()} ",
              style: TextStyle(color: Colors.white),
            ),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      default:
    }
  }
}
