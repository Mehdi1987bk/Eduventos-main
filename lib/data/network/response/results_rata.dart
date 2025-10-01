import 'package:eduventure/data/network/response/result_details_answers.dart';
import 'package:eduventure/data/network/response/result_result.dart';
import 'package:eduventure/data/network/response/subject.dart';
import 'package:eduventure/data/network/response/subject_result.dart';
import 'package:eduventure/domain/entities/pagination.dart';

import 'package:json_annotation/json_annotation.dart';

part 'results_rata.g.dart';

@JsonSerializable()
class ResultsData {
  final List<ResultResult> results;
  final List<SubjectResult> subjects;

  ResultsData({required this.results, required this.subjects});

  factory ResultsData.fromJson(Map<String, dynamic> json) => _$ResultsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsDataToJson(this);
}
