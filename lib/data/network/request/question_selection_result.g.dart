// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_selection_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionSelectionResult _$QuestionSelectionResultFromJson(
        Map<String, dynamic> json) =>
    QuestionSelectionResult(
      id: json['id'] as int,
      answer: json['answer'] as String?,
      time: json['time'] as int,
      answerChangeCount: json['answer_change_count'] as int,
    );

Map<String, dynamic> _$QuestionSelectionResultToJson(
        QuestionSelectionResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'time': instance.time,
      'answer_change_count': instance.answerChangeCount,
    };
