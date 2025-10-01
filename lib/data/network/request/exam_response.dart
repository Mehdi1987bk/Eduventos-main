import '../../../domain/entities/pagination.dart';
import 'exam.dart';

import 'package:json_annotation/json_annotation.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  final Pagination<Exam> list;

  ExamResponse({
    required this.list,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) => _$ExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}