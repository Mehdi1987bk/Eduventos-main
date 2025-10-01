import 'package:eduventure/data/network/response/topics.dart';
import 'package:json_annotation/json_annotation.dart';

part 'classes.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Classes {
  final int id;
  final String slug;
  final String title;
  final int isDeleted;
  final int status;
  final List<Topics>? topics;

  Classes({
    required this.id,
    required this.slug,
    required this.title,
    required this.isDeleted,
    required this.status,
    required this.topics,
  });

  factory Classes.fromJson(Map<String, dynamic> json) => _$ClassesFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesToJson(this);
}
