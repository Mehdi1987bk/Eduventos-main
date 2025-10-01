// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacketsResponse _$PacketsResponseFromJson(Map<String, dynamic> json) =>
    PacketsResponse(
      json['id'] as int,
      json['month'] as int,
      json['price'] as String,
      json['discounted_price'] as String,
      json['title_az'] as String,
      json['content_az'] as String,
    );

Map<String, dynamic> _$PacketsResponseToJson(PacketsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'month': instance.month,
      'price': instance.price,
      'discounted_price': instance.discountedPrice,
      'title_az': instance.titleAz,
      'content_az': instance.contentAz,
    };
