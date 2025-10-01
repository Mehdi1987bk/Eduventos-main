// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_basekt_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBasektData _$GetBasektDataFromJson(Map<String, dynamic> json) =>
    GetBasektData(
      id: json['id'] as int,
      count: json['count'] as int,
      customer: TypeOption.fromJson(json['customer'] as Map<String, dynamic>),
      product: TypeOption.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBasektDataToJson(GetBasektData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'customer': instance.customer,
      'product': instance.product,
    };
