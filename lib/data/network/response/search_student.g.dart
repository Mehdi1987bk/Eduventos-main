// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchStudent _$SearchStudentFromJson(Map<String, dynamic> json) =>
    SearchStudent(
      student: json['student'] == null
          ? null
          : User.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchStudentToJson(SearchStudent instance) =>
    <String, dynamic>{
      'student': instance.student,
    };
