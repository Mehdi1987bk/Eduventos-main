import 'package:eduventure/data/network/response/type_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../../profile_tab/order/widget/category_navigator_pop.dart';
import '../subjects/exam/exam_screen.dart';
import '../subjects/subjects_screen.dart';
import '../subjects/widget/subjects_item.dart';

class StandartListQuestion extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final List<TypeOption> snapshot;
  final int isGroup;
  final String part;
  final int classId;
  final String type;

  const StandartListQuestion({
    super.key,
    required this.title,
    required this.snapshot,
    required this.buttonTitle,
    required this.isGroup,
    required this.part,
    required this.classId,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (MediaQuery.of(context).size.width - 2 * 20 - 10) / 2;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: ListView(
          padding:   EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CategoryNavigatorPop(
                title: title,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(3, (index) {
                  final item = snapshot[index];
                  return SizedBox(
                    width: itemWidth,
                    child: SubjectsItem(
                      imageLocale: item.imageUrl,

                      title: item.title ?? "",
                      buttonTitle: buttonTitle,
                      onTap: () {
                        if (index == 0 || index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectsScreen(
                                title: title,
                                buttonTitle: S.of(context).fnlrBax,
                                buttonTitleChild: index == 0  ? S.of(context).mvzularaBax : S.of(context).daxilOl,
                                elaveTitle: ' ' + S.of(context).sinif,
                                isGroup: isGroup,
                                part: part,
                                classId: classId,
                                type: item.name ?? "",
                              ),
                            ),
                          );
                        }

                        if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamScreen(
                                title: S.of(context).mumiSnaqlar,
                                classId: classId,
                                type: "group",
                                subjectId: 0,
                                isGroup: isGroup,
                                part: part,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
