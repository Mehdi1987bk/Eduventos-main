// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsResponse _$StatisticsResponseFromJson(Map<String, dynamic> json) =>
    StatisticsResponse(
      generalCorrect: (json['generalCorrect'] as num).toDouble(),
      generalWrong: (json['generalWrong'] as num).toDouble(),
      generalUnanswered: (json['generalUnanswered'] as num).toDouble(),
      testCorrect: (json['testCorrect'] as num).toDouble(),
      testWrong: (json['testWrong'] as num).toDouble(),
      testUnanswered: (json['testUnanswered'] as num).toDouble(),
      quizCorrect: (json['quizCorrect'] as num).toDouble(),
      quizWrong: (json['quizWrong'] as num).toDouble(),
      quizUnanswered: (json['quizUnanswered'] as num).toDouble(),
      competitionCorrect: (json['competitionCorrect'] as num).toDouble(),
      competitionWrong: (json['competitionWrong'] as num).toDouble(),
      competitionUnanswered: (json['competitionUnanswered'] as num).toDouble(),
      olympicsCorrect: (json['olympicsCorrect'] as num).toDouble(),
      olympicsWrong: (json['olympicsWrong'] as num).toDouble(),
      olympicsUnanswered: (json['olympicsUnanswered'] as num).toDouble(),
      viktorinaCorrect: (json['viktorinaCorrect'] as num).toDouble(),
      viktorinaWrong: (json['viktorinaWrong'] as num).toDouble(),
      viktorinaUnanswered: (json['viktorinaUnanswered'] as num).toDouble(),
      examTimePercentage: (json['examTimePercentage'] as num).toDouble(),
      platformTimePercentage:
          (json['platformTimePercentage'] as num).toDouble(),
      formattedPlatformTime: json['formattedPlatformTime'] as String,
      formattedExamTime: json['formattedExamTime'] as String,
      countGeneral: (json['countGeneral'] as num).toDouble(),
      countTest: (json['countTest'] as num).toDouble(),
      countQuiz: (json['countQuiz'] as num).toDouble(),
      countCompetition: (json['countCompetition'] as num).toDouble(),
      countOlympics: (json['countOlympics'] as num).toDouble(),
      countViktorina: (json['countViktorina'] as num).toDouble(),
    );

Map<String, dynamic> _$StatisticsResponseToJson(StatisticsResponse instance) =>
    <String, dynamic>{
      'generalCorrect': instance.generalCorrect,
      'generalWrong': instance.generalWrong,
      'generalUnanswered': instance.generalUnanswered,
      'testCorrect': instance.testCorrect,
      'testWrong': instance.testWrong,
      'testUnanswered': instance.testUnanswered,
      'quizCorrect': instance.quizCorrect,
      'quizWrong': instance.quizWrong,
      'quizUnanswered': instance.quizUnanswered,
      'competitionCorrect': instance.competitionCorrect,
      'competitionWrong': instance.competitionWrong,
      'competitionUnanswered': instance.competitionUnanswered,
      'olympicsCorrect': instance.olympicsCorrect,
      'olympicsWrong': instance.olympicsWrong,
      'olympicsUnanswered': instance.olympicsUnanswered,
      'viktorinaCorrect': instance.viktorinaCorrect,
      'viktorinaWrong': instance.viktorinaWrong,
      'viktorinaUnanswered': instance.viktorinaUnanswered,
      'examTimePercentage': instance.examTimePercentage,
      'platformTimePercentage': instance.platformTimePercentage,
      'formattedPlatformTime': instance.formattedPlatformTime,
      'formattedExamTime': instance.formattedExamTime,
      'countGeneral': instance.countGeneral,
      'countTest': instance.countTest,
      'countQuiz': instance.countQuiz,
      'countCompetition': instance.countCompetition,
      'countOlympics': instance.countOlympics,
      'countViktorina': instance.countViktorina,
    };
