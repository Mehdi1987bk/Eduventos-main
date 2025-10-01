import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ManyChart extends StatelessWidget {
  final Map<String, double> dataMap;

  ManyChart({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    final colorList = <Color>[
      Colors.orange,
      Colors.pink.shade300,
      Colors.blue,
      Colors.amber.shade300,
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 0,
        chartRadius: 180,
        colorList: colorList,
        initialAngleInDegree: 0,
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
