import 'package:json_annotation/json_annotation.dart';

part 'color_obj.g.dart';

@JsonSerializable()
class Color {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;

  Color({required String code, required String name});

  Map<String, dynamic> toJson() => {'code': code, 'name': name};

  factory Color.fromJson(Map<String, dynamic> json) =>
      Color(code: json['code'] as String, name: json['name'] as String);
}