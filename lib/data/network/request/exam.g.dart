// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      id: json['id'] as int,
      studentClassId: json['student_class_id'] as int?,
      sectorId: json['sector_id'] as int?,
      image: json['image'] as String?,
      slug: json['slug'] as String?,
      titleAz: json['title_az'] as String?,
      contentAz: json['content_az'] as String?,
      vent: (json['vent'] as num?)?.toDouble(),
      point: json['point'] as String?,
      date: json['date'] as String?,
      minute: json['minute'] as int?,
      count: json['count'] as int?,
      isDeleted: json['is_deleted'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      lastDate: json['last_date'] as String?,
      groupId: json['group_id'] as int?,
      examType: json['exam_type'] as String?,
      type: json['type'] as String?,
      icon: json['icon'] as String?,
      premiumStatus: json['premium_status'] as String?,
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'id': instance.id,
      'student_class_id': instance.studentClassId,
      'sector_id': instance.sectorId,
      'image': instance.image,
      'slug': instance.slug,
      'title_az': instance.titleAz,
      'content_az': instance.contentAz,
      'vent': instance.vent,
      'point': instance.point,
      'date': instance.date,
      'minute': instance.minute,
      'count': instance.count,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'last_date': instance.lastDate,
      'group_id': instance.groupId,
      'exam_type': instance.examType,
      'type': instance.type,
      'icon': instance.icon,
      'premium_status': instance.premiumStatus,
    };
