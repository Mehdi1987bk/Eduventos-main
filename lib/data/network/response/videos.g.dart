// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      id: json['id'] as int,
      studentClassId: json['student_class_id'] as int,
      image: json['image'] as String,
      slug: json['slug'] as String,
      titleAz: json['title_az'] as String,
      contentAz: json['content_az'] as String,
      premiumStatus: json['premium_status'] as int,
      isDeleted: json['is_deleted'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      uid: json['uid'] as String?,
      playbackUrl: json['playback_url'] as String?,
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'id': instance.id,
      'student_class_id': instance.studentClassId,
      'image': instance.image,
      'slug': instance.slug,
      'title_az': instance.titleAz,
      'content_az': instance.contentAz,
      'premium_status': instance.premiumStatus,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'uid': instance.uid,
      'playback_url': instance.playbackUrl,
    };
