// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingStudent _$RatingStudentFromJson(Map<String, dynamic> json) =>
    RatingStudent(
      json['id'] as int,
      json['region_id'] as int,
      json['name'] as String,
      json['surname'] as String,
      json['father'] as String,
      TypeOption.fromJson(json['lang'] as Map<String, dynamic>),
      TypeOption.fromJson(json['region'] as Map<String, dynamic>),
      TypeOption.fromJson(json['student_class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingStudentToJson(RatingStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region_id': instance.regionId,
      'name': instance.name,
      'surname': instance.surname,
      'father': instance.father,
      'lang': instance.lang,
      'region': instance.region,
      'student_class': instance.studentClass,
    };
