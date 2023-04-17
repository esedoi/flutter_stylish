import 'package:flutter_stylish/model/product_obj.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "products")
  List<Product>? products;

  Collection();

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
