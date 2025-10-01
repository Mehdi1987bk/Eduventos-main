import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final double padd;
  final bool? colorRed;
  final Function()? onTap;

  const MenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.padd,
      this.onTap,
      this.colorRed = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(left: 20, right: 20,bottom: 20),
        padding: EdgeInsets.only(left: 24, right: 24, top: 13, bottom: 13),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
              color: AppColors.textColor,
            ),
            SizedBox(
              width: 12,
            ),
            Text(title,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                )),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
