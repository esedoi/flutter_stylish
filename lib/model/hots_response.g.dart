// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hots_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotsResponse _$HotsResponseFromJson(Map<String, dynamic> json) => HotsResponse()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$HotsResponseToJson(HotsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
