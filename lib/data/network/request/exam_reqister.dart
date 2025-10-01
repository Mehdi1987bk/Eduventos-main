import 'package:json_annotation/json_annotation.dart';

part 'exam_reqister.g.dart';

@JsonSerializable()
class ExamReqister {
  final int subjectId;
  final int classId;
  final String type;
  final String? part;
  final int? isGroup;
  final String? searchKey;

  ExamReqister({
    required this.subjectId,
    this.isGroup,
    this.part,
    required this.classId,
    required this.type,
    required this.searchKey,
  });

  factory ExamReqister.fromJson(Map<String, dynamic> json) => _$ExamReqisterFromJson(json);

  Map<String, dynamic> toJson() => _$ExamReqisterToJson(this);
}
