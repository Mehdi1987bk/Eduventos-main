// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      label: json['label'] as String,
      value: json['value'] as String,
      exam: json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
      clickable: json['clickable'] as bool?,
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'exam': instance.exam?.toJson(),
      'clickable': instance.clickable,
    };
