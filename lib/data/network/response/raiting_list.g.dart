// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raiting_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaitingList _$RaitingListFromJson(Map<String, dynamic> json) => RaitingList(
      list: (json['list'] as List<dynamic>)
          .map((e) => RaitingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RaitingListToJson(RaitingList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
