import 'package:flutter/material.dart';

import '../main.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductItem productItem;

  const ProductDetailsScreen({Key? key, required this.productItem})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isLargeScreen = constraints.maxWidth >= 600;

          if (isLargeScreen) {
            return horizontalDetail(context);
          } else {
            return verticalDetail(context);
          }
        },
      ),
    );
  }

  verticalDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            widget.productItem.urlImg,
            fit: BoxFit.cover,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 第一個部分：圖片和商品描述
          Row(
            children: [
              Expanded(
                child: Image.network(
                  widget.productItem.urlImg,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductInfo(context),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 第二個部分：更多圖片
          _buildMoreImages(context),
        ],
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productItem.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 8),
        Text(
          widget.productItem.subtitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 16),
        Text(
          widget.productItem.descriptions,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text(
              '顏色',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: Text('紅色'),
                  selected: true,
                  onSelected: (_) {},
                ),
                ChoiceChip(
                  label: Text('藍色'),
                  selected: false,
                  onSelected: (_) {},
                ),
                ChoiceChip(
                  label: Text('綠色'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text(
              '尺寸',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('S'),
              selected: true,
              onSelected: (_) {},
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('M'),
              selected: false,
              onSelected: (_) {},
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('L'),
              selected: false,
              onSelected: (_) {},
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            InkWell(
              onTap: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              '$quantity',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
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
