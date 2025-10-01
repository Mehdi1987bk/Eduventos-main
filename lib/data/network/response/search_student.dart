import 'package:eduventure/data/network/response/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_student.g.dart';

@JsonSerializable()
class SearchStudent{
  final User? student;

  SearchStudent({required this.student});

  factory SearchStudent.fromJson(Map<String, dynamic> json) => _$SearchStudentFromJson(json);

  Map<String, dynamic> toJson() => _$SearchStudentToJson(this);
}