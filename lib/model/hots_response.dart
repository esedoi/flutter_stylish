import 'package:json_annotation/json_annotation.dart';

import 'collection.dart';

part 'hots_response.g.dart';

@JsonSerializable()
class HotsResponse {
  @JsonKey(name: "data")
  List<Collection>? data;

  HotsResponse();

  factory HotsResponse.fromJson(Map<String, dynamic> json) =>
      _$HotsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HotsResponseToJson(this);
}
