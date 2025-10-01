import 'package:eduventure/data/network/response/vacancy.dart';

import 'package:json_annotation/json_annotation.dart';

part 'vacancies_data.g.dart';

@JsonSerializable()
class VacanciesData{
  final List<Vacancy> list;

  VacanciesData({required this.list});

  factory VacanciesData.fromJson(Map<String, dynamic> json) => _$VacanciesDataFromJson(json);

  Map<String, dynamic> toJson() => _$VacanciesDataToJson(this);
}