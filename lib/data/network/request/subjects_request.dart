import 'package:json_annotation/json_annotation.dart';

part 'subjects_request.g.dart';

@JsonSerializable()
class SubjectsRequest {
  final int isGroup;
  final String part;

  SubjectsRequest({required this.isGroup, required this.part});

  factory SubjectsRequest.fromJson(Map<String, dynamic> json) => _$SubjectsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsRequestToJson(this);
}
