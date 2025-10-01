import 'package:eduventure/data/network/response/rating_student.dart';

import 'package:json_annotation/json_annotation.dart';

part 'raiting_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RaitingResponse {
  final int id;
  final int studentId;
  final int resultId;
  final int row;
  final String vent;
  final RatingStudent student;

  RaitingResponse(this.id, this.studentId, this.resultId, this.row, this.vent, this.student);

  factory RaitingResponse.fromJson(Map<String, dynamic> json) => _$RaitingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RaitingResponseToJson(this);
}
