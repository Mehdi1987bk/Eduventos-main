// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResult _$ResultResultFromJson(Map<String, dynamic> json) => ResultResult(
      id: json['id'] as int,
      studentId: json['student_id'] as int?,
      examId: json['exam_id'] as int?,
      correct: json['correct'] as int?,
      wrong: json['wrong'] as int?,
      answered: json['answered'] as int?,
      unanswered: json['unanswered'] as int?,
      time: json['time'] as String?,
      description: json['description'] as String?,
      exam: json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ResultResultToJson(ResultResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'exam_id': instance.examId,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'answered': instance.answered,
      'unanswered': instance.unanswered,
      'time': instance.time,
      'description': instance.description,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'exam': instance.exam,
    };
