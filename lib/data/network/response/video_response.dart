import 'package:eduventure/data/network/response/topics.dart';
import 'package:json_annotation/json_annotation.dart';

import 'classes.dart';

part 'video_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoResponse {
  final int id;
  final String slug;
  final String titleAz;
  final String image;
  final List<Topics>? topics;
  final List<Classes>? classes;

  VideoResponse({
    required this.id,
    required this.slug,
    required this.topics,
    required this.titleAz,
    required this.image,
     required this.classes,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);
}
