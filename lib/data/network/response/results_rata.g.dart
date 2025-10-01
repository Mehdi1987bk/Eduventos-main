// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_rata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsData _$ResultsDataFromJson(Map<String, dynamic> json) => ResultsData(
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsDataToJson(ResultsData instance) =>
    <String, dynamic>{
      'results': instance.results,
      'subjects': instance.subjects,
    };
