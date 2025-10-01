// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reyting_exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReytingExamResponse _$ReytingExamResponseFromJson(Map<String, dynamic> json) =>
    ReytingExamResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => TypeOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReytingExamResponseToJson(
        ReytingExamResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
