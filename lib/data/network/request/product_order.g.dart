// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) => ProductOrder(
      json['product_id'] as int,
      json['count'] as int,
    );

Map<String, dynamic> _$ProductOrderToJson(ProductOrder instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'count': instance.count,
    };
