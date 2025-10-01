// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      id: json['id'] as int,
      slug: json['slug'] as String,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => Topics.fromJson(e as Map<String, dynamic>))
          .toList(),
      titleAz: json['title_az'] as String,
      image: json['image'] as String,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Classes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title_az': instance.titleAz,
      'image': instance.image,
      'topics': instance.topics,
      'classes': instance.classes,
    };
