import 'package:eduventure/screens/home/tabs/home_tab/subjects/widget/subjects_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/network/response/subject.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import '../../../profile_tab/order/widget/category_navigator_pop.dart';
import '../exam/exam_screen.dart';

class ClassesList extends StatelessWidget {
  final String title;
  final List<Subject> subjects;
  final int classId;
  final String type;
  final String? buttonTitle;

  const ClassesList({
    super.key,
    required this.title,
    required this.subjects,
    required this.classId,
    required this.type,
    this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: CategoryNavigatorPop(
                title: "$title " + S.of(context).sinif,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: subjects.map((item) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 2 * 20 - 10) / 2,
                    child: SubjectsItem(
                      isColorBack: false,
                      image: item.image,
                      title: item.titleAz,
                      buttonTitle: buttonTitle ?? "",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExamScreen(
                            title: item.titleAz ?? "",
                            classId: classId,
                            type: type,
                            subjectId: item.id ?? 0,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
