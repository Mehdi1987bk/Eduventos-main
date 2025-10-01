import 'package:eduventure/data/network/response/user.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class UserEventTable extends StatelessWidget {
  final User user;

  const UserEventTable({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(right: 4),
            padding: EdgeInsets.only(top: 15, bottom: 10),
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.gradient),
                  ),
                  child: Center(
                    child: Text(
                      user.lastVent?.toStringAsFixed(3).toString() ?? "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                    ),
                    child: Text(
                      S.of(context).sonMsabiqZrVent,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )),
        Spacer(),
        Container(
            margin: EdgeInsets.only(right: 4),
            padding: EdgeInsets.only(top: 20, bottom: 15),
            width: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.gradient),
                  ),
                  child: Center(
                    child: Text(
                      user.totalVent?.toStringAsFixed(3).toString() ?? "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 5,
                    ),
                    child: Text(
                      S.of(context).mumiVent,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )),
        Spacer(),
        Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: AppColors.gradient),
                  ),
                  child: Center(
                    child: Text(
                      user.highestVent?.toStringAsFixed(3).toString() ?? "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                    ),
                    child: Text(
                      S.of(context).nYkskVent,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
