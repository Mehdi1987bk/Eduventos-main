// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductRequest _$AddProductRequestFromJson(Map<String, dynamic> json) =>
    AddProductRequest(
      productId: json['product_id'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$AddProductRequestToJson(AddProductRequest instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'count': instance.count,
    };
