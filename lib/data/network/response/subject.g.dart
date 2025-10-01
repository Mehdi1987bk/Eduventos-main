// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      id: json['id'] as int,
      titleAz: json['title_az'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String,
      isDeleted: json['is_deleted'] as int,
      status: json['status'] as int,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'title_az': instance.titleAz,
      'slug': instance.slug,
      'image': instance.image,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
    };
