// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topics _$TopicsFromJson(Map<String, dynamic> json) => Topics(
      id: json['id'] as int,
      subjectId: json['subject_id'] as int,
      slug: json['slug'] as String,
      titleAz: json['title_az'] as String,
      isDeleted: json['is_deleted'] as int,
      status: json['status'] as int,
      studentClassId: json['student_class_id'] as int,
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$TopicsToJson(Topics instance) => <String, dynamic>{
      'id': instance.id,
      'subject_id': instance.subjectId,
      'slug': instance.slug,
      'title_az': instance.titleAz,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'student_class_id': instance.studentClassId,
      'date': instance.date,
      'videos': instance.videos,
    };
