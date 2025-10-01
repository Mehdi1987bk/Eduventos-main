import 'package:json_annotation/json_annotation.dart';

part 'answers.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionSelection {
  final int questionId;
  final String? answer;
  final int time;
  final int answerChangeCount;
  final String? answerOption;

  QuestionSelection({
    required this.questionId,
    this.answer,
    this.answerOption,
    this.time = 0,
    this.answerChangeCount = 0,
  });

  factory QuestionSelection.fromJson(Map<String, dynamic> json) =>
      _$QuestionSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionSelectionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionSelection &&
          runtimeType == other.runtimeType &&
          questionId == other.questionId;

  @override
  int get hashCode => questionId.hashCode;

  QuestionSelection copyWith({
    int? questionId,
    String? answer,
    int? time,
    int? answerChangeCount,
    String? answerOption,
  }) {
    return QuestionSelection(
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
      time: time ?? this.time,
      answerChangeCount: answerChangeCount ?? this.answerChangeCount,
      answerOption: answerOption ?? this.answerOption,
    );
  }

  @override
  String toString() {
    return 'QuestionSelection{questionId: $questionId, time: $time, answerChangeCount: $answerChangeCount}';
  }
}
