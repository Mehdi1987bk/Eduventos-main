// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      count: json['count'] as int?,
      name: json['name'] as String,
      productId: json['product_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'count': instance.count,
      'product_id': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'images': instance.images,
      'category': instance.category,
    };
