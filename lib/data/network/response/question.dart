import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Question{

  final int id;
  final int? studentClassId;
  final int? sectorId;
  final int? subjectId;
  final String? level;
  final String? titleType;
  final String? variantType;
  final String? title;
  @JsonKey(name: "A")
  final String Aoption;
  @JsonKey(name: "B")
  final String Boption;
  @JsonKey(name: "C")
  final String Coption;
  @JsonKey(name: "D")
  final String Doption;
  @JsonKey(name: "E")
  final String Eoption;
  final String correct;
  final String? text;
  final int? userId;
  final int? teacherId;
  final String? questionText;
  final String? description;
  final String? type;
  final String? forWho;
  final int? order;


  Question({
    required this.id,
    required this.studentClassId,
    required this.sectorId,
    required this.subjectId,
    required this.level,
    required this.titleType,
    required this.variantType,
    required this.title,
    required this.Aoption,
    required this.Boption,
    required this.Coption,
    required this.Doption,
    required this.Eoption,
    required this.correct,
    required this.text,
    required this.userId,
    required this.teacherId,
    required this.questionText,
    required this.description,
    required this.type,
    required this.forWho,
    required this.order,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
