// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsRequest _$SubjectsRequestFromJson(Map<String, dynamic> json) =>
    SubjectsRequest(
      isGroup: json['isGroup'] as int,
      part: json['part'] as String,
    );

Map<String, dynamic> _$SubjectsRequestToJson(SubjectsRequest instance) =>
    <String, dynamic>{
      'isGroup': instance.isGroup,
      'part': instance.part,
    };
