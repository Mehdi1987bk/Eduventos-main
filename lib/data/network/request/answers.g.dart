// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionSelection _$QuestionSelectionFromJson(Map<String, dynamic> json) =>
    QuestionSelection(
      questionId: json['question_id'] as int,
      answer: json['answer'] as String?,
      answerOption: json['answer_option'] as String?,
      time: json['time'] as int? ?? 0,
      answerChangeCount: json['answer_change_count'] as int? ?? 0,
    );

Map<String, dynamic> _$QuestionSelectionToJson(QuestionSelection instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'answer': instance.answer,
      'time': instance.time,
      'answer_change_count': instance.answerChangeCount,
      'answer_option': instance.answerOption,
    };
