// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsData _$OrderDetailsDataFromJson(Map<String, dynamic> json) =>
    OrderDetailsData(
      (json['data'] as List<dynamic>)
          .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsDataToJson(OrderDetailsData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
