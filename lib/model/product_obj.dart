import 'package:flutter_stylish/model/variant_obj.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_obj.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "texture")
  String? texture;
  @JsonKey(name: "wash")
  String? wash;
  @JsonKey(name: "place")
  String? place;
  @JsonKey(name: "note")
  String? note;
  @JsonKey(name: "story")
  String? story;
  @JsonKey(name: "main_image")
  String? mainImage;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "colors")
  List<Map<String, dynamic>>? colors;
  @JsonKey(name: "sizes")
  List<String>? sizes;
  @JsonKey(name: "variants")
  List<Variant>? variants;

  Product();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
