// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection()
  ..title = json['title'] as String?
  ..products = (json['products'] as List<dynamic>?)
      ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'title': instance.title,
      'products': instance.products,
    };
