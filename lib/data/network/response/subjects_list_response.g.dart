// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsListResponse _$SubjectsListResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectsListResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => TypeOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsListResponseToJson(
        SubjectsListResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
