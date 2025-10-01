// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vacancy _$VacancyFromJson(Map<String, dynamic> json) => Vacancy(
      id: json['id'] as int,
      slug: json['slug'] as String?,
      titleAz: json['title_az'] as String?,
      contentAz: json['content_az'] as String?,
      readCount: json['read_count'] as int?,
      isDeleted: json['is_deleted'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$VacancyToJson(Vacancy instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title_az': instance.titleAz,
      'content_az': instance.contentAz,
      'read_count': instance.readCount,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
