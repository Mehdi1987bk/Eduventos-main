import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/network/response/purchase.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';

class PaymentItem extends StatelessWidget {
  final Purchase purchase;

  const PaymentItem({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        border: Border.all(color: AppColors.appColor.withOpacity(0.2), width: 2),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.appColor,
            ),
            child: Center(
              child: Icon(Icons.account_balance_wallet_rounded, color: Colors.white),
            ),
          ),
          Spacer(),
          Text(
            DateFormat('dd.MM.yyyy').format(purchase.createdAt),
            style: TextStyle(color: AppColors.textColor, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(
            (purchase.type != "purchase" ? "+" : "-") + purchase.price.toString() + " " + S.of(context).azn,
            style: TextStyle(
                color: purchase.type != "purchase" ? Colors.green : Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
