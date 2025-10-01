// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionQuestions _$QuestionQuestionsFromJson(Map<String, dynamic> json) =>
    QuestionQuestions(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionQuestionsToJson(QuestionQuestions instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };
