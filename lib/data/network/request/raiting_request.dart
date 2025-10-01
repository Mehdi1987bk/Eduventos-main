import 'package:json_annotation/json_annotation.dart';

part 'raiting_request.g.dart';

@JsonSerializable(includeIfNull: false)
class RaitingRequest {
  final int? examId;
  final int? regionId;
  final int? classId;

  RaitingRequest({
    required this.examId,
    required this.regionId,
    required this.classId,
  });

  factory RaitingRequest.fromJson(Map<String, dynamic> json) => _$RaitingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RaitingRequestToJson(this);
}
