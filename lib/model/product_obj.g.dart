// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product()
  ..id = json['id'] as int?
  ..category = json['category'] as String?
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..price = json['price'] as int?
  ..texture = json['texture'] as String?
  ..wash = json['wash'] as String?
  ..place = json['place'] as String?
  ..note = json['note'] as String?
  ..story = json['story'] as String?
  ..mainImage = json['main_image'] as String?
  ..images =
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..colors = (json['colors'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList()
  ..sizes = (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..variants = (json['variants'] as List<dynamic>?)
      ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'texture': instance.texture,
      'wash': instance.wash,
      'place': instance.place,
      'note': instance.note,
      'story': instance.story,
      'mainImage': instance.mainImage,
      'images': instance.images,
      'colors': instance.colors,
      'sizes': instance.sizes,
      'variants': instance.variants,
    };
