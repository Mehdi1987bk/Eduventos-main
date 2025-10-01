// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instructions _$InstructionsFromJson(Map<String, dynamic> json) => Instructions(
      id: json['id'] as int?,
      titleAz: json['title_az'] as String?,
      video: json['video'] as String?,
      status: json['status'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$InstructionsToJson(Instructions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_az': instance.titleAz,
      'video': instance.video,
      'status': instance.status,
      'type': instance.type,
    };
