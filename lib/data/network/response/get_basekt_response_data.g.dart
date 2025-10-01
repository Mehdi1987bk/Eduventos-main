// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_basekt_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBasektResponseData _$GetBasektResponseDataFromJson(
        Map<String, dynamic> json) =>
    GetBasektResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => GetBasektData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBasektResponseDataToJson(
        GetBasektResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
