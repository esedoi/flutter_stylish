// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      colorCode: json['color_code'] as String?,
      size: json['size'] as String?,
      stock: json['stock'] as int?,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'color_code': instance.colorCode,
      'size': instance.size,
      'stock': instance.stock,
    };
