import 'package:eduventure/screens/home/tabs/profile_tab/widget/statistika_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/statistics_response.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import 'circul_statistic.dart';
import 'info_statistic.dart';
import 'maniy_statistic.dart';

class StatisticInfo extends StatelessWidget {
  final StatisticsResponse item;

  const StatisticInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoStatistics(
          title: S.of(context).uurDrcsi,
          dataMap: {
            S.of(context).doruCavablar: Colors.green,
            S.of(context).yanlCavablar: Colors.red,
            S.of(context).cavablandrlmayan: Colors.grey
          },
        ),
        QuizStatsPage(
          statistics: [
            {
              "correct": item.quizCorrect,
              "wrong": item.quizWrong,
              "unanswered": item.quizUnanswered
            },
            {
              "correct": item.testCorrect,
              "wrong": item.testWrong,
              "unanswered": item.testUnanswered
            },
            {
              "correct": item.generalCorrect,
              "wrong": item.generalWrong,
              "unanswered": item.generalUnanswered
            },
            {
              "correct": item.competitionCorrect,
              "wrong": item.competitionWrong,
              "unanswered": item.competitionUnanswered
            },
          ],
        ),
        InfoStatistics(
          title: S.of(context).platformaGstricilri,
          dataMap: {
            S.of(context).mtahandaKeirilnVaxt + "\n${item.formattedExamTime}": Colors.orange,
            S.of(context).platformadaKeirilnVaxt + "\n${item.formattedPlatformTime}": Colors.blue,
          },
        ),
        DonutChart(
          dataMap: {
            S.of(context).platformadaKeirilnVaxt: item.platformTimePercentage,
            S.of(context).mtahandaKeirilnVaxt: item.examTimePercentage,
          },
        ),
        InfoStatistics(
          title: S.of(context).tirakEtdiyiImtahanlar,
          dataMap: {
            S.of(context).quizlr + " : ${formatPrice(item.countQuiz)}": Colors.pink.shade400,
            S.of(context).testlr + " : ${formatPrice(item.countTest)}": Colors.orange,
            S.of(context).mumiSnaqlar + " : ${formatPrice(item.countGeneral)}": Colors.blue,
            S.of(context).msabiqlr + " : ${formatPrice(item.countCompetition)}":
                Colors.amber.shade300,
          },
        ),
        ManyChart(
          dataMap: {
            S.of(context).quizlr: item.countQuiz,
            S.of(context).testlr: item.countTest,
            S.of(context).mumiSnaqlar: item.countGeneral,
            S.of(context).msabiqlr: item.countCompetition,
          },
        ),
      ],
    );
  }
}
