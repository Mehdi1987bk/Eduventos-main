// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) =>
    ResultResponse(
      examId: json['exam_id'] as int,
      studentId: json['student_id'] as int,
      correct: json['correct'] as int,
      wrong: json['wrong'] as int,
      answered: json['answered'] as int,
      unanswered: json['unanswered'] as int,
      time: json['time'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'exam_id': instance.examId,
      'student_id': instance.studentId,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'answered': instance.answered,
      'unanswered': instance.unanswered,
      'time': instance.time,
      'id': instance.id,
    };
