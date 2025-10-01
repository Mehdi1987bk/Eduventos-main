import 'package:json_annotation/json_annotation.dart';

part 'get_posts_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetPostsResponse {
  final String? titleAz;
  final String? contentAz;
  final String? image;
  final int? readCount;
  final int? status;
  final DateTime? createdAt;

  GetPostsResponse({
    this.titleAz,
    this.contentAz,
    this.image,
    this.readCount,
    this.status,
    this.createdAt,
  });

  factory GetPostsResponse.fromJson(Map<String, dynamic> json) => _$GetPostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostsResponseToJson(this);
}
