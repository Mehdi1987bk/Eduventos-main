import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';

class AddBalanceItem extends StatelessWidget {
  const AddBalanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: AppColors.appColor,
          ),
          SizedBox(width: 5),
          Text(
            S.of(context).balansArtr,
            style: TextStyle(color: AppColors.appColor),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
