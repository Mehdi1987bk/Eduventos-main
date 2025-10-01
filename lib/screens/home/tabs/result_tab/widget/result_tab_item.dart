import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/type_option.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../generated/l10n.dart';
import '../../home_tab/subjects/widget/subjects_item.dart';
import '../result_subject/result_exam/result_exam_screen.dart';
import '../result_subject/result_subject_screen.dart';
import '../result_tab_bloc.dart';

class ResultTabItem extends StatelessWidget {
  final ResultTabBloc bloc;
  final List<TypeOption> snapshot;
  final int userId;
  final User user;

  const ResultTabItem({
    super.key,
    required this.snapshot,
    required this.bloc,
    required this.userId,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: snapshot.map((item) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 25,
            child: SubjectsItem(
              imageLocale: item.imageUrl,
              title: item.title ?? "",
              buttonTitle: S.of(context).daxilOl,
              onTap: () {
                bloc
                    .results(
                  subject: item.boolParams ?? false,
                  type: item.name ?? "",
                  studentId: userId,
                )
                    .then((value) {
                  if (item.id == 1 || item.id == 2 || item.id == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubjectsResultScreen(
                          title: item.title ?? "",
                          data: value,
                          type: item.name ?? "",
                          boolParams: item.boolParams ?? false,
                          subjectId: item.id ?? 0,
                          userId: userId,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultExamScreen(
                          title: item.titleAz ?? "",
                          resultExam: value.results,
                        ),
                      ),
                    );
                  }
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
