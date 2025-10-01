// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOrderRequest _$SendOrderRequestFromJson(Map<String, dynamic> json) =>
    SendOrderRequest(
      price: (json['price'] as num).toDouble(),
      note: json['note'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$SendOrderRequestToJson(SendOrderRequest instance) =>
    <String, dynamic>{
      'price': instance.price,
      'note': instance.note,
      'products': instance.products,
    };
