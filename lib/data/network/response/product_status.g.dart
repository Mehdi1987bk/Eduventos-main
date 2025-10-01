// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStatus _$ProductStatusFromJson(Map<String, dynamic> json) =>
    ProductStatus(
      json['status'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$ProductStatusToJson(ProductStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
    };
