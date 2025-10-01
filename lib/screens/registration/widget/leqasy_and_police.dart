import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../presentation/resourses/app_colors.dart';

class LegasyAndPolice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).qeydiyyatdanKerk + " ",
              style:
                  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 14),
            ),
            GestureDetector(
              onTap: (){},
              child: Text(
                S.of(context).qaydalarVRtlrl,
                style:
                    TextStyle(color: AppColors.leqasy, fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ],
        ),
        Text(
          S.of(context).razlamOlursunuz + " ",
          style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 14),
        )
      ],
    );
  }
}
