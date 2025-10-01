import 'package:eduventure/data/network/response/question.dart';

import 'package:json_annotation/json_annotation.dart';

part 'question_questions.g.dart';

@JsonSerializable()
class QuestionQuestions{
  final List<Question> questions;

  QuestionQuestions({required this.questions});

  factory QuestionQuestions.fromJson(Map<String, dynamic> json) => _$QuestionQuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionQuestionsToJson(this);


}