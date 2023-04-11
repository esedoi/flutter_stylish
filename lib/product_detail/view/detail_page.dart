import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_widget.dart';
import 'package:flutter_stylish/product_detail/view/quata_selector.dart';
import 'package:flutter_stylish/product_detail/view/size_selector.dart';

import '../../main.dart';
import 'color_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductItem productItem;

  ProductDetailsScreen({Key? key, required this.productItem}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isLargeScreen = constraints.maxWidth >= 650;

          if (isLargeScreen) {
            return AppStateWidget(
                productItem: widget.productItem,
                child: horizontalDetail(context));
          } else {
            return AppStateWidget(
                productItem: widget.productItem,
                child: verticalDetail(context));
          }
        },
      ),
    );
  }

  verticalDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(
                widget.productItem.urlImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductInfo(context),
              ],
            ),
          ),
          _buildMoreImages(context),
        ],
      ),
    );
  }

  horizontalDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Image.network(
                    widget.productItem.urlImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductInfo(context),
                  ],
                ),
              ),
            ],
          ),
          _buildMoreImages(context),
        ],
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Container(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productItem.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.productItem.productNumber,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Text(
            widget.productItem.subtitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 16),
          ColorSelector(),
          SizedBox(height: 16),
          SizeSelector(),
          SizedBox(height: 16),
          QuataSelector(),
          MaterialButton(
            minWidth: 300.0,
            height: 50.0,
            color: Colors.grey[800],
            onPressed: () {},
            child: Text(
              '請選擇購物車',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            widget.productItem.descriptions,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMoreImages(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Images',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 16),
          SizedBox(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: widget.productItem.moreImgs.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Image.network(
                      widget.productItem.moreImgs[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






