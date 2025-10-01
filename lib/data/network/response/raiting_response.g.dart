// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raiting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaitingResponse _$RaitingResponseFromJson(Map<String, dynamic> json) =>
    RaitingResponse(
      json['id'] as int,
      json['student_id'] as int,
      json['result_id'] as int,
      json['row'] as int,
      json['vent'] as String,
      RatingStudent.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RaitingResponseToJson(RaitingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'result_id': instance.resultId,
      'row': instance.row,
      'vent': instance.vent,
      'student': instance.student,
    };
