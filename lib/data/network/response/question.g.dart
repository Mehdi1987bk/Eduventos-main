// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as int,
      studentClassId: json['student_class_id'] as int?,
      sectorId: json['sector_id'] as int?,
      subjectId: json['subject_id'] as int?,
      level: json['level'] as String?,
      titleType: json['title_type'] as String?,
      variantType: json['variant_type'] as String?,
      title: json['title'] as String?,
      Aoption: json['A'] as String,
      Boption: json['B'] as String,
      Coption: json['C'] as String,
      Doption: json['D'] as String,
      Eoption: json['E'] as String,
      correct: json['correct'] as String,
      text: json['text'] as String?,
      userId: json['user_id'] as int?,
      teacherId: json['teacher_id'] as int?,
      questionText: json['question_text'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      forWho: json['for_who'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'student_class_id': instance.studentClassId,
      'sector_id': instance.sectorId,
      'subject_id': instance.subjectId,
      'level': instance.level,
      'title_type': instance.titleType,
      'variant_type': instance.variantType,
      'title': instance.title,
      'A': instance.Aoption,
      'B': instance.Boption,
      'C': instance.Coption,
      'D': instance.Doption,
      'E': instance.Eoption,
      'correct': instance.correct,
      'text': instance.text,
      'user_id': instance.userId,
      'teacher_id': instance.teacherId,
      'question_text': instance.questionText,
      'description': instance.description,
      'type': instance.type,
      'for_who': instance.forWho,
      'order': instance.order,
    };
