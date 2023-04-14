import 'package:flutter/material.dart';

import '../main.dart';
import 'data_class.dart';

List<CardItem> items = [
    CardItem(urlImg: 'https://picsum.photos/1600/900'),
    CardItem(urlImg: 'https://picsum.photos/1600/900'),
    CardItem(urlImg: 'https://picsum.photos/1600/900'),
    CardItem(urlImg: 'https://picsum.photos/1600/900'),
    CardItem(urlImg: 'https://picsum.photos/1600/900'),
    CardItem(urlImg: 'https://picsum.photos/1600/900'),
  ];

  List<ProductItem> productList = [
    ProductItem(
        urlImg: 'https://picsum.photos/1600/900',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$999",
        productNumber: "20230203101",
        moreImgs: [
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900'
        ],
        descriptions: "UNIQLO 特級輕羽絨外套",
        detail:'o.n.s is all about options, which is why we take about all',
        colorOption: [
      ColorOption(
        color: Colors.green,
        sizeOptions: [
          SizeOption(size: "S", stock: 10),
          SizeOption(size: "M", stock: 5),
          SizeOption(size: "L", stock: 3),
        ],
      ),
      ColorOption(
        color: Colors.blue,
        sizeOptions: [
          SizeOption(size: "S", stock: 5),
          SizeOption(size: "M", stock: 7),
          SizeOption(size: "L", stock: 8),
        ],
      ),
      ColorOption(
        color: Colors.yellow,
        sizeOptions: [
          SizeOption(size: "S", stock: 2),
          SizeOption(size: "M", stock: 9),
          SizeOption(size: "L", stock: 4),
        ],
      ),
    ],),
    ProductItem(
        urlImg: 'https://picsum.photos/1600/900',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$980",
        productNumber: "20230203101",
        moreImgs: [
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900'
        ],
        descriptions: "UNIQLO 特級輕羽絨外套",
        detail:'o.n.s is all about options, which is why we take about all',
        colorOption: [
      ColorOption(
        color: Colors.red,
        sizeOptions: [
          SizeOption(size: "S", stock: 10),
          SizeOption(size: "M", stock: 5),
          SizeOption(size: "L", stock: 3),
        ],
      ),
      ColorOption(
        color: Colors.blue,
        sizeOptions: [
          SizeOption(size: "S", stock: 5),
          SizeOption(size: "M", stock: 7),
          SizeOption(size: "L", stock: 8),
        ],
      ),
    ],),
    ProductItem(
        urlImg: 'https://picsum.photos/1600/900',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$970",
        productNumber: "20230203101",
        moreImgs: [
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900'
        ],
        descriptions: "UNIQLO 特級輕羽絨外套",
        detail:'o.n.s is all about options, which is why we take about all',
        colorOption: [
      ColorOption(
        color: Colors.red,
        sizeOptions: [
          SizeOption(size: "S", stock: 10),
          SizeOption(size: "M", stock: 5),
          SizeOption(size: "L", stock: 3),
        ],
      ),
      ColorOption(
        color: Colors.blue,
        sizeOptions: [
          SizeOption(size: "S", stock: 5),
          SizeOption(size: "M", stock: 7),
          SizeOption(size: "L", stock: 8),
        ],
      ),
    ],),
    ProductItem(
        urlImg: 'https://picsum.photos/1600/900',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$991",
        productNumber: "20230203101",
        moreImgs: [
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900'
        ],
        descriptions: "UNIQLO 特級輕羽絨外套",
        detail:'o.n.s is all about options, which is why we take about all',
        colorOption: [
      ColorOption(
        color: Colors.red,
        sizeOptions: [
          SizeOption(size: "S", stock: 10),
          SizeOption(size: "M", stock: 5),
          SizeOption(size: "L", stock: 3),
        ],
      ),
      ColorOption(
        color: Colors.blue,
        sizeOptions: [
          SizeOption(size: "S", stock: 5),
          SizeOption(size: "M", stock: 7),
          SizeOption(size: "L", stock: 8),
        ],
      ),
    ],),
    ProductItem(
        urlImg: 'https://picsum.photos/1600/900',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$991",
        productNumber: '20230203101',
        moreImgs: [
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900'
        ],
        descriptions: "UNIQLO 特級輕羽絨外套",
        detail:'o.n.s is all about options, which is why we take about all',
        colorOption: [
      ColorOption(
        color: Colors.red,
        sizeOptions: [
          SizeOption(size: "S", stock: 10),
          SizeOption(size: "M", stock: 5),
          SizeOption(size: "L", stock: 3),
        ],
      ),
      ColorOption(
        color: Colors.blue,
        sizeOptions: [
          SizeOption(size: "S", stock: 5),
          SizeOption(size: "M", stock: 7),
          SizeOption(size: "L", stock: 8),
        ],
      ),
    ],),
    ProductItem(
        urlImg: 'https://picsum.photos/1600/900',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$991",
        productNumber: '20230203101',
        moreImgs: [
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900',
          'https://picsum.photos/1600/900'
        ],
        descriptions: "UNIQLO 特級輕羽絨外套",
        detail:'o.n.s is all about options, which is why we take about all',
        colorOption: [
      ColorOption(
        color: Colors.red,
        sizeOptions: [
          SizeOption(size: "S", stock: 10),
          SizeOption(size: "M", stock: 5),
          SizeOption(size: "L", stock: 3),
        ],
      ),
      ColorOption(
        color: Colors.blue,
        sizeOptions: [
          SizeOption(size: "S", stock: 5),
          SizeOption(size: "M", stock: 7),
          SizeOption(size: "L", stock: 8),
        ],
      ),
    ],),
  ];