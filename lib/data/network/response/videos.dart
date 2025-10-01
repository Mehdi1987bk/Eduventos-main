
import 'package:json_annotation/json_annotation.dart';

part 'videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Videos {
  final int id;
  final int studentClassId;
  final String image;
  final String slug;
  final String titleAz;
  final String contentAz;
  final int premiumStatus;
  final int isDeleted;
  final String createdAt;
  final String updatedAt;
  final String? uid;
  final String? playbackUrl;

  Videos({
    required this.id,
    required this.studentClassId,
    required this.image,
    required this.slug,
    required this.titleAz,
    required this.contentAz,
    required this.premiumStatus,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
    required this.playbackUrl,
  });


  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}
