import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int current;
  final int total;

  const CustomProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = current / total;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 5,
        width: double.infinity,
        color: Colors.grey.shade300,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: percentage,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
