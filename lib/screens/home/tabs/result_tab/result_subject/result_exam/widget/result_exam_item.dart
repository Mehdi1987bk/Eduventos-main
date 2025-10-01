import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/start_questions/start_questions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../data/network/request/exam.dart';
import '../../../../../../../data/network/response/result_result.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../home_tab/subjects/exam/exam_result/exam_result_screen.dart';
import '../../../../home_tab/subjects/exam/exam_result/questions_result_details/questions_result_details_screen.dart';

class ResultExamItem extends StatelessWidget {
  final ResultResult exam;
  final int examId;

  const ResultExamItem({
    super.key,
    required this.exam,
    required this.examId,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
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
                        exam.exam?.titleAz ?? "",
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
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_outlined,
                          color: Colors.blue,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            S.of(context).mtahandaMddti +
                                " ${formatTime(int.tryParse(exam.time ?? "0") ?? 0)} deq",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.help,
                          color: Colors.green,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            S.of(context).cavablandrlmSual + " " + exam.answered.toString() ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            S.of(context).cavablandrlmamSual +" " + exam.unanswered.toString() ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                                '${exam.exam?.count} ' + S.of(context).sual,
                                style: TextStyle(color: AppColors.appColorTwo),
                              ),
                              if (exam.exam?.minute != null)
                                Row(children: [
                                  SizedBox(width: 16),
                                  Icon(Icons.access_time_filled,
                                      size: 18, color: AppColors.appColorTwo),
                                  SizedBox(width: 4),
                                  Text(
                                    '${exam.exam?.minute} ' + S.of(context).deq,
                                    style: TextStyle(color: AppColors.appColorTwo),
                                  ),
                                ]),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExamResultScreen(
                                      answerCount: exam.exam?.count ?? 0,
                                      resultId: exam.id,
                                      answered: exam.answered ?? 0,
                                      unanswered: exam.unanswered ?? 0,
                                      correct: exam.correct ?? 0,
                                      wrong: exam.wrong ?? 0,
                                      resultTime: int.tryParse(exam.time ?? "0") ?? 0,
                                      vent: exam.exam?.vent,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: AppColors.gradient,
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).nticyBax,
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 40),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              DateFormat('d MMMM yyyy, HH:mm').format(exam.updatedAt ?? DateTime.now()),
              style:
                  TextStyle(color: AppColors.textColor, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  String formatTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;

    return '$minutes.${seconds.toString().padLeft(2, '0')}';
  }
}
