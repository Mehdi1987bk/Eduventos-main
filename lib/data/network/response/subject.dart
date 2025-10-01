import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Subject {
  final int id;
  final String titleAz;
  final String slug;
  final String image;
  final int isDeleted;
  final int status;

  Subject({
    required this.id,
    required this.titleAz,
    required this.slug,
    required this.image,
    required this.isDeleted,
    required this.status,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
