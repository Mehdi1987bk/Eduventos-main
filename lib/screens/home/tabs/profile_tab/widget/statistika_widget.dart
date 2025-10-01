import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../generated/l10n.dart';

class QuizStatsPage extends StatefulWidget {
  List<Map<String, double>> statistics;

  QuizStatsPage({super.key, required this.statistics});

  @override
  State<QuizStatsPage> createState() => _QuizStatsPageState();
}

class _QuizStatsPageState extends State<QuizStatsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentStat = widget.statistics[selectedIndex];
    final List<String> categories = [
      S.of(context).quizlr,
      S.of(context).testlr,
      S.of(context).mumiSnaqlar,
      S.of(context).msabiqlr,
    ];
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 0 ? AppColors.appColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        categories[0],
                        style: TextStyle(
                          color: selectedIndex == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 1 ? AppColors.appColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        categories[1],
                        style: TextStyle(
                          color: selectedIndex == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 2 ? AppColors.appColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        categories[2],
                        style: TextStyle(
                          color: selectedIndex == 2 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 3 ? AppColors.appColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        categories[3],
                        style: TextStyle(
                          color: selectedIndex == 3 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        PieChartScreen(
          correct: currentStat["correct"]!,
          wrong: currentStat["wrong"]!,
          unanswered: currentStat["unanswered"]!,
        ),
      ],
    );
  }
}

class PieChartScreen extends StatelessWidget {
  final double correct;
  final double wrong;
  final double unanswered;

  const PieChartScreen({
    super.key,
    required this.correct,
    required this.wrong,
    required this.unanswered,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Correct": correct,
      "Wrong": wrong,
      "Unanswered": unanswered,
    };

    final colorList = <Color>[
      Colors.green,
      Colors.red,
      Colors.grey,
    ];

    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 2.2,
        colorList: colorList,
        initialAngleInDegree: 270,
        chartType: ChartType.disc,
        ringStrokeWidth: 32,
        centerText: "",
        legendOptions: const LegendOptions(
          showLegends: false,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 0,
          chartValueStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
