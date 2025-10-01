import 'package:eduventure/data/network/response/question.dart';

import 'package:json_annotation/json_annotation.dart';

part 'result_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultDetails {
  final int id;
  final int resultId;
  final int questionId;
  final String? correctAnswer;
  final String? studentAnswer;
  final String? time;
  final int? answerChangeCount;
  final String? feedback;
  final Question question;

  ResultDetails(
      {required this.id,
      required this.resultId,
      required this.questionId,
      required this.correctAnswer,
      required this.studentAnswer,
      required this.time,
      required this.answerChangeCount,
      required this.feedback,
      required this.question});

  factory ResultDetails.fromJson(Map<String, dynamic> json) => _$ResultDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDetailsToJson(this);
}
