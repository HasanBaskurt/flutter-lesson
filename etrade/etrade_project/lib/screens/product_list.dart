import 'package:etrade_project/db/db_helper.dart';
import 'package:etrade_project/models/product.dart';
import 'package:etrade_project/screens/product_add.dart';
import 'package:etrade_project/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  DbHelper dbHelper = DbHelper();
  Product product = Product("Excalibur", "Laptop", 12650);
  List<Product> productList = [];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (productList.length == 0) {
      getData();
    }
    return Scaffold(
      body: ProductListItems(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          goToProductAdd();
        },
        tooltip: "Add product button",
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListView ProductListItems() {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.amber,
            elevation: 2,
            child: ListTile(
              leading: const CircleAvatar(
                  backgroundColor: Colors.amber, child: Icon(Icons.laptop)),
              title: Text(productList[position].getName.toString()),
              subtitle: Text(productList[position].getDescription.toString()),
              onTap: () {
                goToDetail(productList[position]);
              },
            ),
          );
        });
  }

  void getData() {
    var dbFuture = dbHelper.initializeDb();
    dbFuture.then((result) {
      var productsFuture = dbHelper.getProducts();

      productsFuture.then((data) {
        ///dbHelper.insert(product);
        List<Product> productsData = [];
        count = data.length;
        for (int i = 0; i < count; i++) {
          productsData.add(Product.fromObject(data[i]));
        }
        setState(() {
          productList = productsData;
          count = count;
        });
      });
    });
  }

  void goToDetail(Product product) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(product)));
    if (result != null) {
      if (result != 0) {
        getData();
      }
    }
  }

  void goToProductAdd() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductAdd()));
    if (result != null) {
      if (result != 0) {
        getData();
      }
    }
  }
}
