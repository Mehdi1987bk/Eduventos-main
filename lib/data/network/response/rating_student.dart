import 'package:eduventure/data/network/response/type_option.dart';

import 'package:json_annotation/json_annotation.dart';

part 'rating_student.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RatingStudent {
  final int id;
  final int regionId;
  final String name;
  final String surname;
  final String father;
  final TypeOption lang;
  final TypeOption region;
  final TypeOption studentClass;

  RatingStudent(
    this.id,
    this.regionId,
    this.name,
    this.surname,
    this.father,
    this.lang,
    this.region,
    this.studentClass,
  );

  factory RatingStudent.fromJson(Map<String, dynamic> json) => _$RatingStudentFromJson(json);

  Map<String, dynamic> toJson() => _$RatingStudentToJson(this);
}
