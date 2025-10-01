// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResult _$QuestionResultFromJson(Map<String, dynamic> json) =>
    QuestionResult(
      examId: json['examId'] as int,
      answers: (json['answers'] as List<dynamic>)
          .map((e) =>
              QuestionSelectionResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => CurrentAnswersRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionResultToJson(QuestionResult instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'questions': instance.questions,
      'answers': instance.answers,
    };
