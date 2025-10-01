// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsResponse _$GetPostsResponseFromJson(Map<String, dynamic> json) =>
    GetPostsResponse(
      titleAz: json['title_az'] as String?,
      contentAz: json['content_az'] as String?,
      image: json['image'] as String?,
      readCount: json['read_count'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$GetPostsResponseToJson(GetPostsResponse instance) =>
    <String, dynamic>{
      'title_az': instance.titleAz,
      'content_az': instance.contentAz,
      'image': instance.image,
      'read_count': instance.readCount,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
    };
