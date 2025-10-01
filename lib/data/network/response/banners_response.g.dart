// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
    };
