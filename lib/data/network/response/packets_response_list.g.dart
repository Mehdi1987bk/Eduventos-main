// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packets_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacketsResponseList _$PacketsResponseListFromJson(Map<String, dynamic> json) =>
    PacketsResponseList(
      list: (json['list'] as List<dynamic>)
          .map((e) => PacketsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PacketsResponseListToJson(
        PacketsResponseList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
