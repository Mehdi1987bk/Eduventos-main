// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_details_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDetailsAnswers _$ResultDetailsAnswersFromJson(
        Map<String, dynamic> json) =>
    ResultDetailsAnswers(
      answers: (json['answers'] as List<dynamic>)
          .map((e) => ResultDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultDetailsAnswersToJson(
        ResultDetailsAnswers instance) =>
    <String, dynamic>{
      'answers': instance.answers,
    };
