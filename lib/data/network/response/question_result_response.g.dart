// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResultResponse _$QuestionResultResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionResultResponse(
      result: ResultResponse.fromJson(json['result'] as Map<String, dynamic>),
      vent: (json['vent'] as num).toDouble(),
    );

Map<String, dynamic> _$QuestionResultResponseToJson(
        QuestionResultResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'vent': instance.vent,
    };
