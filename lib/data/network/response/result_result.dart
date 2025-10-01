
import 'package:json_annotation/json_annotation.dart';

import '../request/exam.dart';

part 'result_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake,)
class ResultResult{

  final int id;
  final int? studentId;
  final int? examId;
  final int? correct;
  final int? wrong;
  final int? answered;
  final int? unanswered;
  final String? time;
  final String? description;
  final DateTime? updatedAt;
  final Exam? exam;

  ResultResult({
    required this.id,
    required this.studentId,
    required this.examId,
    required this.correct,
    required this.wrong,
    required this.answered,
    required this.unanswered,
    required this.time,
    required this.description,
    required this.exam,
    required this.updatedAt
  });

  factory ResultResult.fromJson(Map<String, dynamic> json) => _$ResultResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultResultToJson(this);
}