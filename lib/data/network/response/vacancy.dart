
import 'package:json_annotation/json_annotation.dart';

part 'vacancy.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Vacancy{
  final int id;
  final String? slug;
  final String? titleAz;
  final String? contentAz;
  final int? readCount;
  final int? isDeleted;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  Vacancy({
    required this.id,
    required this.slug,
    required this.titleAz,
    required this.contentAz,
    required this.readCount,
    required this.isDeleted,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) => _$VacancyFromJson(json);

  Map<String, dynamic> toJson() => _$VacancyToJson(this);

}

