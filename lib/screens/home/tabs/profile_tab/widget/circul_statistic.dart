import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class DonutChart extends StatelessWidget {
  final Map<String, double> dataMap;
  const DonutChart({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {


    final colorList = <Color>[
      Colors.blue.shade700,
      Colors.orange.shade400,
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 0,
        chartRadius: 150,
        colorList: colorList,
        initialAngleInDegree: -90,
        chartType: ChartType.ring,
        ringStrokeWidth: 30,
        centerText: "",
        legendOptions: const LegendOptions(
          showLegends: false,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValues: false,
        ),
      ),
    );
  }
}
