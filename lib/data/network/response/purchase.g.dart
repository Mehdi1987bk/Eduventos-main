// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      json['type'] as String,
      json['price'] as String?,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
      'created_at': instance.createdAt.toIso8601String(),
    };
