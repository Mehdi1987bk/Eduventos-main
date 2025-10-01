import 'package:eduventure/data/network/response/videos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topics.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Topics {
  final int id;
  final int subjectId;
  final String slug;
  final String titleAz;
  final int isDeleted;
  final int status;
  final int studentClassId;
  final String date;
  final List<Videos> videos;

  Topics({
    required this.id,
    required this.subjectId,
    required this.slug,
    required this.titleAz,
    required this.isDeleted,
    required this.status,
    required this.studentClassId,
    required this.videos,
    required this.date,
  });

  factory Topics.fromJson(Map<String, dynamic> json) => _$TopicsFromJson(json);

  Map<String, dynamic> toJson() => _$TopicsToJson(this);
}
