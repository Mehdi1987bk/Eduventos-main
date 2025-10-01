import 'package:eduventure/data/network/response/question.dart';
import 'package:eduventure/data/network/response/question_questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_list.g.dart';

@JsonSerializable()
class QuestionList {
  final QuestionQuestions list;

  QuestionList({required this.list});

  factory QuestionList.fromJson(Map<String, dynamic> json) => _$QuestionListFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionListToJson(this);
}
