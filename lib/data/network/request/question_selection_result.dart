import 'package:json_annotation/json_annotation.dart';

part 'question_selection_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionSelectionResult {
  final int id;
  final String? answer;
  final int time;
  final int answerChangeCount;

  QuestionSelectionResult({
    required this.id,
     this.answer,
    required this.time,
    required this.answerChangeCount,
  });

  factory QuestionSelectionResult.fromJson(Map<String, dynamic> json) =>
      _$QuestionSelectionResultFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionSelectionResultToJson(this);

  @override
  String toString() {
    return 'QuestionSelectionResult{id: $id, answer: $answer, time: $time, answerChangeCount: $answerChangeCount}';
  }
}
