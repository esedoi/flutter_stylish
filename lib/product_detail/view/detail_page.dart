import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/product_detail/view/quata_selector.dart';
import 'package:flutter_stylish/product_detail/view/size_selector.dart';

import '../../data/data_class.dart';
import '../bloc/product_detail_bloc.dart';
import 'color_selector.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductItem productItem;

  ProductDetailsScreen({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDetailBloc(productItem),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isLargeScreen = constraints.maxWidth >= 650;

            if (isLargeScreen) {
              return HorizontalDetail(productItem: productItem);
            } else {
              return VerticalDetail(productItem: productItem);
            }
          },
        ),
      ),
    );
  }
}

class VerticalDetail extends StatelessWidget {
  final ProductItem productItem;
  VerticalDetail({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(
                productItem.urlImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfo(productItem: productItem),
              ],
            ),
          ),
          MoreImages(productItem: productItem),
        ],
      ),
    );
  }
}

class HorizontalDetail extends StatelessWidget {
  final ProductItem productItem;
  HorizontalDetail({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    productItem.urlImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(productItem: productItem),
                  ],
                ),
              ),
            ],
          ),
          MoreImages(productItem: productItem),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final ProductItem productItem;
  ProductInfo({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productItem.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            productItem.productNumber,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Text(
            productItem.subtitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 16),
          ColorSelector(productItem: productItem),
          SizedBox(height: 16),
          SizeSelector(productItem: productItem),
          SizedBox(height: 16),
          QuataSelector(productItem: productItem),
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
            productItem.descriptions,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MoreImages extends StatelessWidget {
  final ProductItem productItem;
  MoreImages({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              itemCount: productItem.moreImgs.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Image.network(
                      productItem.moreImgs[index],
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
