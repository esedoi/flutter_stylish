import 'package:json_annotation/json_annotation.dart';

part 'variant_obj.g.dart';

@JsonSerializable()
class Variant {
  @JsonKey(name : "color_code")
  String? colorCode;
  @JsonKey(name : "size")
  String? size;
  @JsonKey(name : "stock")
  int? stock;

  Variant({required this.colorCode, required this.size, required this.stock});

   factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}