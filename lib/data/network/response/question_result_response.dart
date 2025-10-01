import 'package:eduventure/data/network/response/result_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'question_result_response.g.dart';

@JsonSerializable()
class QuestionResultResponse {
  final ResultResponse result;
  final double vent;

  QuestionResultResponse({
    required this.result,
    required this.vent,
  });

  factory QuestionResultResponse.fromJson(Map<String, dynamic> json) => _$QuestionResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResultResponseToJson(this);

}

