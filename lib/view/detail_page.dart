import 'package:flutter/material.dart';

import '../main.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductItem productItem;

  const ProductDetailsScreen({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              productItem.urlImg,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  productItem.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                Text(
                  productItem.subtitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 16),
                Text(
                  productItem.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}