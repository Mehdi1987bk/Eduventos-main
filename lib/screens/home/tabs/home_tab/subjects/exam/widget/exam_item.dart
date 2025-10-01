import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/widget/premium_alert.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/start_questions/start_questions_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/payment/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/network/request/exam.dart';
import '../../../../../../../data/network/response/user.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../profile_tab/widget/logout_dialog.dart';

class ExamItem extends StatelessWidget {
  final Exam exam;
  final int classId;
  final int subjectId;
  final String type;
  final String title;
  final User user;

  const ExamItem({
    super.key,
    required this.exam,
    required this.classId,
    required this.type,
    required this.subjectId,
    required this.title,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        "asset/vec_img.png",
                        color: Colors.white,
                        width: 24,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      width: MediaQuery.of(context).size.width * 0.66,
                      child: Text(
                        exam.titleAz ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.help, size: 18, color: AppColors.appColorTwo),
                              SizedBox(width: 4),
                              Text(
                                '${exam.count} ' + S.of(context).sual,
                                style: TextStyle(color: AppColors.appColorTwo),
                              ),
                              if (exam.minute != null)
                                Row(children: [
                                  SizedBox(width: 16),
                                  Icon(Icons.access_time_filled,
                                      size: 18, color: AppColors.appColorTwo),
                                  SizedBox(width: 4),
                                  Text(
                                    '${exam.minute} ' + S.of(context).deq,
                                    style: TextStyle(color: AppColors.appColorTwo),
                                  ),
                                ]),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (exam.premiumStatus != "1") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StartQuestions(
                                          exam: exam,
                                          title: title,
                                        ),
                                      ),
                                    );
                                  }
                                  if (exam.premiumStatus == "1" &&
                                      (user.subsTime == null || user.subsTime == 0)) {
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return PremiumAlert(
                                          title: S.of(context).abunlikPaketiTlbOlunur,
                                          desc:
                                              S.of(context).buImtahanaDaxilOlmaqNAbunlikPaketiAlnmaldrBalansnzArtraraq,
                                          user: user,
                                        );
                                      },
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StartQuestions(
                                          exam: exam,
                                          title: title,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: AppColors.gradientGreen,
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).daxilOl,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          if (exam.premiumStatus == "1")
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  right: 30,
                ),
                child: Image.asset(
                  'asset/premium.png',
                  width: 20,
                ),
              ),
            ),
          if (exam.premiumStatus != "1")
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  right: 30,
                ),
                child: Text(
                  S.of(context).nmun,
                  style: TextStyle(
                    color: AppColors.appColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
