
import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultResponse{
  final int examId;
  final int studentId;
  final int correct;
  final int wrong;
  final int answered;
  final int unanswered;
  final int time;
  final int id;


  ResultResponse({
    required this.examId,
    required this.studentId,
    required this.correct,
    required this.wrong,
    required this.answered,
    required this.unanswered,
    required this.time,
    required this.id,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> json) => _$ResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}


