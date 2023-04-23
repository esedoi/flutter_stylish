import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/product_detail/view/quata_selector.dart';
import 'package:flutter_stylish/product_detail/view/size_selector.dart';

import '../../model/product_obj.dart';
import '../bloc/product_detail_bloc.dart';
import 'color_selector.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDetailBloc(product),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isLargeScreen = constraints.maxWidth >= 650;

            if (isLargeScreen) {
              return HorizontalDetail(product: product);
            } else {
              return VerticalDetail(product: product);
            }
          },
        ),
      ),
    );
  }
}

class VerticalDetail extends StatelessWidget {
  final Product product;
  VerticalDetail({Key? key, required this.product}) : super(key: key);

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
                product.mainImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfo(product: product),
              ],
            ),
          ),
          MoreImages(product: product),
        ],
      ),
    );
  }
}

class HorizontalDetail extends StatelessWidget {
  final Product product;
  HorizontalDetail({Key? key, required this.product}) : super(key: key);

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
                    product.mainImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(product: product),
                  ],
                ),
              ),
            ],
          ),
          MoreImages(product: product),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final Product product;
  ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            product.price.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Text(
            product.description!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 16),
          ColorSelector(product: product),
          SizedBox(height: 16),
          SizeSelector(product: product),
          SizedBox(height: 16),
          QuataSelector(product: product),
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
            product.description!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MoreImages extends StatelessWidget {
  final Product product;
  MoreImages({Key? key, required this.product}) : super(key: key);

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
              itemCount: product.images!.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Image.network(
                      product.images![index],
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
