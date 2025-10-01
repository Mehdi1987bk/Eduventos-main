
import 'package:json_annotation/json_annotation.dart';

part 'exam.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Exam{
  final int id;
  final int? studentClassId;
  final int? sectorId;
  final String? image;
  final String? slug;
  final String? titleAz;
  final String? contentAz;
  final double? vent;
  final String? point;
  final String? date;
  final int? minute;
  final int? count;
  final int? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  final String? lastDate;
  final int? groupId;
  final String? examType;
  final String? type;
  final String? icon;
  final String? premiumStatus;


  Exam({
    required this.id,
      this.studentClassId,
     this.sectorId,
     this.image,
     this.slug,
     this.titleAz,
     this.contentAz,
     this.vent,
     this.point,
     this.date,
     this.minute,
     this.count,
     this.isDeleted,
     this.createdAt,
     this.updatedAt,
     this.lastDate,
     this.groupId,
     this.examType,
     this.type,
     this.icon,
     this.premiumStatus,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);

}
