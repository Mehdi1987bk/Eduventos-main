// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancies_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacanciesData _$VacanciesDataFromJson(Map<String, dynamic> json) =>
    VacanciesData(
      list: (json['list'] as List<dynamic>)
          .map((e) => Vacancy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VacanciesDataToJson(VacanciesData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
