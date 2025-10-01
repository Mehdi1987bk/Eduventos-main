import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/subjects_bloc.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/widget/subjects_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/home/tabs/result_tab/result_subject/result_exam/result_exam_screen.dart';
import 'package:eduventure/screens/home/tabs/result_tab/result_subject/result_subject_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../data/network/response/results_rata.dart';
import '../../../../../generated/l10n.dart';

class SubjectsResultScreen extends BaseScreen {
  final bool boolParams;
  final String type;
  final String title;
  final int? subjectId;
  final int userId;
  final ResultsData data;

  SubjectsResultScreen({
    super.key,
    required this.title,
    required this.data,
    required this.type,
    required this.userId,
    required this.boolParams,
     required this.subjectId,
  });

  @override
  State<SubjectsResultScreen> createState() => _SubjectsResultScreenState();
}

class _SubjectsResultScreenState extends BaseState<SubjectsResultScreen, SubjectsResultBloc> {
  @override
  Widget body() {
    return Container(
      color: AppColors.bgColor,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CategoryNavigatorPop(
              title: widget.title,
            ),
          ),
          if (widget.data.subjects.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: widget.data.subjects.map((item) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    child: SubjectsItem(
                      image: item.image,
                      title: item.titleAz ?? "",
                      buttonTitle: S.of(context).sein,
                      onTap: () {
                        bloc.results(
                          subject: widget.boolParams,
                          type: widget.type,
                          subjectId: item.id,
                          studentId: widget.userId,
                        ).then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultExamScreen(
                                title: item.titleAz ?? "",
                                resultExam: value.results,
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            )
          else
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
                    "Nəticə tapılmadı",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
    );
  }

  @override
  SubjectsResultBloc provideBloc() {
    return SubjectsResultBloc();
  }
}
