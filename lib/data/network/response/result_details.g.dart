// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDetails _$ResultDetailsFromJson(Map<String, dynamic> json) =>
    ResultDetails(
      id: json['id'] as int,
      resultId: json['result_id'] as int,
      questionId: json['question_id'] as int,
      correctAnswer: json['correct_answer'] as String?,
      studentAnswer: json['student_answer'] as String?,
      time: json['time'] as String?,
      answerChangeCount: json['answer_change_count'] as int?,
      feedback: json['feedback'] as String?,
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultDetailsToJson(ResultDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result_id': instance.resultId,
      'question_id': instance.questionId,
      'correct_answer': instance.correctAnswer,
      'student_answer': instance.studentAnswer,
      'time': instance.time,
      'answer_change_count': instance.answerChangeCount,
      'feedback': instance.feedback,
      'question': instance.question,
    };
