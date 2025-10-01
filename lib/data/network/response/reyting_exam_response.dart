import 'package:eduventure/data/network/response/type_option.dart';

import '../../../domain/entities/pagination.dart';
import '../request/exam.dart';

import 'package:json_annotation/json_annotation.dart';

part 'reyting_exam_response.g.dart';

@JsonSerializable()
class ReytingExamResponse {
  final List<TypeOption> list;

  ReytingExamResponse({
    required this.list,
  });

  factory ReytingExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ReytingExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReytingExamResponseToJson(this);
}
