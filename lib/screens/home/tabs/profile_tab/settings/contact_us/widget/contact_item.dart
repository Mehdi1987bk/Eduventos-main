import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../presentation/resourses/app_colors.dart';

class ContactItem extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? buttonTitle;
  final VoidCallback? onTap;

  const ContactItem({super.key, required this.icon, this.title, this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.appColor.withOpacity(0.3),
            ),
            child: Center(
              child: Image.asset(icon ?? "asset/quiz_icon.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Text(
              title ?? "",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20,bottom: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.textColor,
                    width: 1,
                  )),
              height: 40,
              child: Center(
                child: Text(
                  buttonTitle ?? "",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
