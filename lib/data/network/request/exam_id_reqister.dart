
import 'package:json_annotation/json_annotation.dart';

part 'exam_id_reqister.g.dart';

@JsonSerializable()
class ExamIdReqister{

  final int examId;
  ExamIdReqister({required this.examId});


  factory ExamIdReqister.fromJson(Map<String, dynamic> json) => _$ExamIdReqisterFromJson(json);

  Map<String, dynamic> toJson() => _$ExamIdReqisterToJson(this);

}