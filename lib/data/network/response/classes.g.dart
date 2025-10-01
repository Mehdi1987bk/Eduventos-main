// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classes _$ClassesFromJson(Map<String, dynamic> json) => Classes(
      id: json['id'] as int,
      slug: json['slug'] as String,
      title: json['title'] as String,
      isDeleted: json['is_deleted'] as int,
      status: json['status'] as int,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => Topics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassesToJson(Classes instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'topics': instance.topics,
    };
