// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.orange,
              size: 40,
            )),
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigatorBar(),
    ));
  }

  _buildProductDetails(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImages(),
              _buildProductTitle(),
              const SizedBox(
                height: 12,
              ),
              _buildProductprice(),
              const SizedBox(
                height: 12,
              ),
              _buildDivider(screenSize),
              const SizedBox(
                height: 12,
              ),
              _buildFurtherInfo(),
              const SizedBox(
                height: 12,
              ),
              _buildDivider(screenSize),
              const SizedBox(
                height: 12,
              ),
              _buildSizeArea(),
              const SizedBox(
                height: 12,
              ),
              // _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesTabController = TabController(length: 3, vsync: this);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Center(
            child: DefaultTabController(
                length: 3,
                child: Stack(children: [
                  TabBarView(
                    controller: imagesTabController,
                    children: [
                      Image.network(
                          "https://onlinespormalzemeleri.com/materials/images/products/products/1/1799/2038/nike-m-nk-flc-park20-po-hoodie-cw6894-451-sweat-shirt-s10-p5-1200x800-i2038.png"),
                      Image.network(
                          "https://onlinespormalzemeleri.com/materials/images/products/products/1/1799/2039/nike-m-nk-flc-park20-po-hoodie-cw6894-451-sweat-shirt-s10-p5-1200x800-i2039.png"),
                      Image.network(
                          "https://onlinespormalzemeleri.com/materials/images/products/products/1/1799/2038/nike-m-nk-flc-park20-po-hoodie-cw6894-451-sweat-shirt-s10-p5-1200x800-i2038.png"),
                    ],
                  ),
                  Container(
                    alignment: const FractionalOffset(0.5, 0.95),
                    child: TabPageSelector(
                      controller: imagesTabController,
                      color: Colors.grey,
                      selectedColor: Colors.orange,
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Text(
          "Nike Sweat Shirt",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildProductprice() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(" %50 Discount",
                style: TextStyle(color: Colors.green, fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "\$ 300",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("\$ 150",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
          ],
        ));
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Icon(
            Icons.local_offer,
            color: Colors.grey,
          ),
          SizedBox(
            width: 12,
          ),
          Text("Click for more information.",
              style: TextStyle(
                color: Colors.grey,
              )),
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.straighten,
                color: Colors.grey,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Size : M",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                "Beden Tablosu",
                style: TextStyle(color: Colors.blueAccent, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildBottomNavigatorBar() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 1,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.grey,
                child: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Request",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )),
          // ignore: duplicate_ignore
          Flexible(
              flex: 2,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.greenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_basket_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Add to basket",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  /* _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  "Product Info",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Wash Info",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: TabBarView(
              controller: tabController,
              children: const [
                Text("%60 Cotton, %30 polyester"),
                Text("%60 Cotton, %30 polyester"),
              ],
            ),
          ),
        ],
      ),
    );
  }*/
}
