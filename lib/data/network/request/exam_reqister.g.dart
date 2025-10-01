// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_reqister.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamReqister _$ExamReqisterFromJson(Map<String, dynamic> json) => ExamReqister(
      subjectId: json['subjectId'] as int,
      isGroup: json['isGroup'] as int?,
      part: json['part'] as String?,
      classId: json['classId'] as int,
      type: json['type'] as String,
      searchKey: json['searchKey'] as String?,
    );

Map<String, dynamic> _$ExamReqisterToJson(ExamReqister instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'classId': instance.classId,
      'type': instance.type,
      'part': instance.part,
      'isGroup': instance.isGroup,
      'searchKey': instance.searchKey,
    };
