import 'package:e_commerce_poject/utilities/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductListRow extends StatelessWidget {
  String name;
  int currentPrice;
  int originalPrice;
  int discount;
  String imageUrl;

  ProductListRow(
    this.name,
    this.currentPrice,
    this.originalPrice,
    this.discount,
    this.imageUrl, {Key? key}
  ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Image.network(imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Column(
                    children: [
                      Text(" %$discount Discount",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 14)),
                      Row(
                        children: [
                          Text(
                            "\$ $originalPrice",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("\$ $currentPrice",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
