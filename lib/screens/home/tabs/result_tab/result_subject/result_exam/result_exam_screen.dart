import 'package:eduventure/screens/home/tabs/result_tab/result_subject/result_exam/widget/result_exam_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/network/response/result_result.dart';
import '../../../../../../data/network/response/subject_result.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import '../../../home_tab/subjects/widget/subjects_item.dart';
import '../../../profile_tab/order/widget/category_navigator_pop.dart';

class ResultExamScreen extends StatefulWidget {
  final List<ResultResult> resultExam;
  final String title;

  const ResultExamScreen({
    super.key,
    required this.title,
    required this.resultExam,
  });

  @override
  State<ResultExamScreen> createState() => _ResultExamScreenState();
}

class _ResultExamScreenState extends State<ResultExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        color: AppColors.bgColor,
        child: ListView(
          padding: EdgeInsets.only(bottom: 20),
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CategoryNavigatorPop(
                title: widget.title,
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.resultExam.length,
              itemBuilder: (context, index) {
                final item = widget.resultExam[index];
                return ResultExamItem(exam: item, examId: item.id);
              },
            ),
            if(widget.resultExam.length == 0)
            Column(
              children: [
                const SizedBox(height: 200),
                Image.asset(
                  "asset/tex_not.png",
                  width: 150,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    S.of(context).nticTaplmad,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      height: 1.29,
                      letterSpacing: -0.43,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
