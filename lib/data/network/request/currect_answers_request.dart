
import 'package:json_annotation/json_annotation.dart';

part 'currect_answers_request.g.dart';

@JsonSerializable()
class CurrentAnswersRequest {
  final int id;
  final String? correct;

  CurrentAnswersRequest({required this.id, required this.correct});

  factory CurrentAnswersRequest.fromJson(Map<String, dynamic> json) => _$CurrentAnswersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentAnswersRequestToJson(this);

  @override
  String toString() {
    return 'CurrentAnswersRequest{id: $id, correct: $correct}';
  }
}