import 'package:json_annotation/json_annotation.dart';

part 'reyting_exam_request.g.dart';

@JsonSerializable()
class ReytingExamRequest {
  final String type;

  ReytingExamRequest({required this.type});

  factory ReytingExamRequest.fromJson(Map<String, dynamic> json) =>
      _$ReytingExamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReytingExamRequestToJson(this);
}
