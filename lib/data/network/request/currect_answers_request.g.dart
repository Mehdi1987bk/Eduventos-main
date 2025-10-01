// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currect_answers_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentAnswersRequest _$CurrentAnswersRequestFromJson(
        Map<String, dynamic> json) =>
    CurrentAnswersRequest(
      id: json['id'] as int,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$CurrentAnswersRequestToJson(
        CurrentAnswersRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct': instance.correct,
    };
