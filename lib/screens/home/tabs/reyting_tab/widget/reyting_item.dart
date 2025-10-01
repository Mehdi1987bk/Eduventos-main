import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/raiting_response.dart';
import '../../../../../generated/l10n.dart';

class ReytingItem extends StatelessWidget {
  final RaitingResponse item;

  const ReytingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                item.student.name + " " + item.student.surname,
                style: TextStyle(
                  color: AppColors.darkBlue3d,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              if (item.row == 1)
                Image.asset(
                  "asset/reyt_1.png",
                  width: 22,
                ),
              if (item.row == 2)
                Image.asset(
                  "asset/reyt_2.png",
                  width: 22,
                ),
              if (item.row == 3)
                Image.asset(
                  "asset/reyt_3.png",
                  width: 22,
                ),
              Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.appColor,
                ),
                child: Text(
                  item.row.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                (item.student.studentClass.title ?? "") + " " + S.of(context).sinif,
                style: TextStyle(
                  color: AppColors.darkBlue3d,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                (item.student.lang.titleAz ?? ""),
                style: TextStyle(
                  color: AppColors.darkBlue3d,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                (item.student.region.titleAz ?? ""),
                style: TextStyle(
                  color: AppColors.darkBlue3d,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Text(
                "${item.vent} " + S.of(context).vent,
                style: TextStyle(
                  color: AppColors.appYello,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
