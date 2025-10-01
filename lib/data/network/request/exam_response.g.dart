// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
      list: Pagination<Exam>.fromJson(json['list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
