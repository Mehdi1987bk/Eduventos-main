import 'package:flutter/material.dart';

import '../../../../../presentation/resourses/app_colors.dart';

class InfoStatistics extends StatelessWidget {
  final String title;
  final Map<String, Color> dataMap;

  const InfoStatistics({super.key, required this.title, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataMap.length,
              itemBuilder: (context, index) {
                final entry = dataMap.entries.elementAt(index);
                final label = entry.key;
                final color = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        label,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }
          )

        ],
      ),
    );
  }
}
