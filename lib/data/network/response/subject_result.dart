import 'package:eduventure/data/network/request/exam.dart';

import 'package:json_annotation/json_annotation.dart';

part 'subject_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SubjectResult{

  final int id;
  final String? slug;
  final String? titleAz;
  final String? titleEn;
  final String? titleRu;
  final int? isDeleted;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final int? orderNumber;
  final String? image;

  SubjectResult({
    required this.id,
    required this.slug,
    required this.titleAz,
    required this.titleEn,
    required this.titleRu,
    required this.isDeleted,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
    required this.image,
  });

  factory SubjectResult.fromJson(Map<String, dynamic> json) => _$SubjectResultFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResultToJson(this);

}

