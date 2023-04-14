import 'dart:ui';

class ProductItem {
  final String urlImg;
  final String title;
  final String subtitle;
  final String productNumber;
  final List<String> moreImgs;
  final String descriptions;
  final String detail;
  final  List<ColorOption> colorOption;

  const ProductItem(
      {required this.urlImg,
      required this.title,
      required this.subtitle,
      required this.productNumber,
      required this.moreImgs,
      required this.descriptions,
      required this.detail,
      required this.colorOption});
}

class ColorOption{
  Color color;
  List<SizeOption> sizeOptions;

  ColorOption({
    required this.color,
    required this.sizeOptions,
  });
  
}

class SizeOption {
  String size;
  int stock;

  SizeOption({
    required this.size,
    required this.stock,
  });
}