import 'package:eduventure/data/network/response/result_details.dart';

import 'package:json_annotation/json_annotation.dart';

part 'result_details_answers.g.dart';

@JsonSerializable()
class ResultDetailsAnswers {
  final List<ResultDetails> answers;

  ResultDetailsAnswers({required this.answers});

  factory ResultDetailsAnswers.fromJson(Map<String, dynamic> json) =>
      _$ResultDetailsAnswersFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDetailsAnswersToJson(this);
}
