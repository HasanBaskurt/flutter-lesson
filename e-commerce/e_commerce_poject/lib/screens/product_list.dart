import 'package:e_commerce_poject/widgets/product_list_row.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  @override
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _buildProductListPage(),
    ));
  }

  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    // ignore: avoid_unnecessary_containers
    return Container(
        child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildFilterWidgets(screenSize);
        } else if (index == 4) {
          return const SizedBox(
            height: 12,
          );
        } else {
          return _buildProductListRow();
        }
      },
    ));
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSortButton("Sort By"),
              Container(
                color: Colors.grey,
                width: 1,
                height: 24,
              ),
              _buildFilterButton("Filter"),
            ],
          ),
        ),
      ),
    );
  }

  _buildSortButton(String title) {
    return InkWell(
      onTap: () {
        // ignore: avoid_print
        print(title);
      },
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            color: Colors.orange,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(title),
        ],
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        // ignore: avoid_print
        print(title);
      },
      child: Row(
        children: [
          const Icon(
            Icons.filter_alt_outlined,
            color: Colors.orange,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(title),
        ],
      ),
    );
  }

  _buildProductListRow() {
    return ProductListRow("Sweater", 150, 300, 50,
        "https://onlinespormalzemeleri.com/materials/images/products/products/1/1799/2038/nike-m-nk-flc-park20-po-hoodie-cw6894-451-sweat-shirt-s10-p5-1200x800-i2038.png");
  }
}
