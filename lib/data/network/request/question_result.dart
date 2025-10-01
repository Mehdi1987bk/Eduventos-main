import 'package:eduventure/data/network/request/question_selection_result.dart';
import 'package:eduventure/data/network/response/type_option.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/widget/navigate_answer.dart';
import 'package:json_annotation/json_annotation.dart';

import 'answers.dart';
import 'currect_answers_request.dart';

part 'question_result.g.dart';

@JsonSerializable()
class QuestionResult {
  final int examId;
   final List<CurrentAnswersRequest> questions;
   final List<QuestionSelectionResult> answers;

  QuestionResult({
    required this.examId,
    required this.answers,
    required this.questions,
  });

  factory QuestionResult.fromJson(Map<String, dynamic> json) => _$QuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}