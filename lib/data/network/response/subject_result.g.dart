// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResult _$SubjectResultFromJson(Map<String, dynamic> json) =>
    SubjectResult(
      id: json['id'] as int,
      slug: json['slug'] as String?,
      titleAz: json['title_az'] as String?,
      titleEn: json['title_en'] as String?,
      titleRu: json['title_ru'] as String?,
      isDeleted: json['is_deleted'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      orderNumber: json['order_number'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SubjectResultToJson(SubjectResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title_az': instance.titleAz,
      'title_en': instance.titleEn,
      'title_ru': instance.titleRu,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'order_number': instance.orderNumber,
      'image': instance.image,
    };
