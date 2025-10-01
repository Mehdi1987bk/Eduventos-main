// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotifications _$GetNotificationsFromJson(Map<String, dynamic> json) =>
    GetNotifications(
      json['id'] as int,
      json['student_id'] as int,
      json['student_parent_id'] as int?,
      json['added_parent_id'] as int?,
      json['image'] as String?,
      json['title'] as String?,
      json['text'] as String?,
      json['read_status'] as int?,
      json['type'] as String?,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$GetNotificationsToJson(GetNotifications instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'student_parent_id': instance.studentParentId,
      'added_parent_id': instance.addedParentId,
      'image': instance.image,
      'title': instance.title,
      'text': instance.text,
      'read_status': instance.readStatus,
      'type': instance.type,
      'created_at': instance.createdAt.toIso8601String(),
    };
