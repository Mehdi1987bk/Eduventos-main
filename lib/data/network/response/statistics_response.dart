
import 'package:json_annotation/json_annotation.dart';

part 'statistics_response.g.dart';

@JsonSerializable()
class StatisticsResponse {
  final double generalCorrect;
  final double generalWrong;
  final double generalUnanswered;
  final double testCorrect;
  final double testWrong;
  final double testUnanswered;
  final double quizCorrect;
  final double quizWrong;
  final double quizUnanswered;
  final double competitionCorrect;
  final double competitionWrong;
  final double competitionUnanswered;
  final double olympicsCorrect;
  final double olympicsWrong;
  final double olympicsUnanswered;
  final double viktorinaCorrect;
  final double viktorinaWrong;
  final double viktorinaUnanswered;
  final double examTimePercentage;
  final double platformTimePercentage;
  final String formattedPlatformTime;
  final String formattedExamTime;
  final double countGeneral;
  final double countTest;
  final double countQuiz;
  final double countCompetition;
  final double countOlympics;
  final double countViktorina;

  StatisticsResponse({
    required this.generalCorrect,
    required this.generalWrong,
    required this.generalUnanswered,
    required this.testCorrect,
    required this.testWrong,
    required this.testUnanswered,
    required this.quizCorrect,
    required this.quizWrong,
    required this.quizUnanswered,
    required this.competitionCorrect,
    required this.competitionWrong,
    required this.competitionUnanswered,
    required this.olympicsCorrect,
    required this.olympicsWrong,
    required this.olympicsUnanswered,
    required this.viktorinaCorrect,
    required this.viktorinaWrong,
    required this.viktorinaUnanswered,
    required this.examTimePercentage,
    required this.platformTimePercentage,
    required this.formattedPlatformTime,
    required this.formattedExamTime,
    required this.countGeneral,
    required this.countTest,
    required this.countQuiz,
    required this.countCompetition,
    required this.countOlympics,
    required this.countViktorina,
  });

  factory StatisticsResponse.fromJson(Map<String, dynamic> json) => _$StatisticsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsResponseToJson(this);

 }

