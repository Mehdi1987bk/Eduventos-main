// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasesResponse _$PurchasesResponseFromJson(Map<String, dynamic> json) =>
    PurchasesResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => Purchase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchasesResponseToJson(PurchasesResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
