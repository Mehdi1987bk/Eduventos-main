// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      json['id'] as int,
      (json['price'] as num).toDouble(),
      json['note'] as String?,
      (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      ProductStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'note': instance.note,
      'products': instance.products,
      'status': instance.status,
    };
