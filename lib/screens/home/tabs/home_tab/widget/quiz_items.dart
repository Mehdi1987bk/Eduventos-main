import 'package:eduventure/screens/home/tabs/home_tab/widget/quiz_dropdaun.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/standart_list_question.dart';
import 'package:flutter/material.dart';
import '../../../../../data/network/response/type_option.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../subjects/exam/exam_screen.dart';
import '../subjects/widget/subjects_is_group_0.dart';

class QuizItems extends StatelessWidget {
  final User user;
  final TypeOption? initialBranch;
  final ValueChanged<TypeOption?> onBranchSelected;
  final List<TypeOption> branches;

  const QuizItems({
    super.key,
    required this.user,
    required this.onBranchSelected,
    required this.initialBranch,
    required this.branches,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.horizontal,
        children: [
          if (user.studentClass?.title == "9" ||
              user.studentClass?.title == "10" ||
              user.studentClass?.title == "11")
            QuizSelector(
              branches: branches,
              onBranchSelected: onBranchSelected,
              initialBranch: initialBranch,
              title: S.of(context).dilSein,
            ),
          GestureDetector(
            onTap: () {
              if (initialBranch?.id == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubjectsIsGroup0(
                      title: initialBranch?.id == 1 ? S.of(context).quizlr : S.of(context).buraxlMrhlsi,
                      buttonTitle: S.of(context).mvzularaBax,
                      elaveTitle: ' ' + S.of(context).sinif,
                      isGroup: 0,
                      part: 'first',
                      type: initialBranch?.id == 1 ? "quiz" : "group",
                      classId: int.tryParse(user.studentClass?.title ?? "") ?? 0,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StandartListQuestion(
                      title: initialBranch?.id == 1 ? S.of(context).quizlr : S.of(context).buraxlMrhlsi,
                      buttonTitle: S.of(context).siniflrBax,
                      snapshot: [
                        TypeOption(
                            id: 1, title: S.of(context).quizlr, name: "quiz", imageUrl: "asset/quziler.png"),
                        TypeOption(
                            id: 2, title: S.of(context).testlr, name: "test", imageUrl: "asset/testler.png"),
                        //Todo add 2 parametrs
                        TypeOption(
                            id: 2,
                            title: S.of(context).buraxlImtahan,
                            name: "",
                            imageUrl: "asset/buraxilis_imtahan blok.png"),
                      ],
                      isGroup: 1,
                      part: 'first',
                      classId: int.tryParse(user.studentClass?.title ?? "") ?? 0,
                      type: initialBranch?.id == 1 ? "quiz" : "group",
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.tabIcon.withOpacity(0.3), AppColors.tabIcon.withOpacity(0.3)],
                ),
              ),
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Center(
                child: Text(
                  initialBranch?.id == 1 ? S.of(context).quizlr : S.of(context).buraxlMrhlsi,
                  style: TextStyle(
                      color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (initialBranch?.id == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubjectsIsGroup0(
                      title: initialBranch?.id == 1 ? S.of(context).testlr : S.of(context).blokMrhlsi,
                      buttonTitle: S.of(context).daxilOl,
                      elaveTitle: ' sinif',
                      isGroup: 0,
                      part: 'second',
                      classId: int.tryParse(user.studentClass?.title ?? "") ?? 0,
                      type: initialBranch?.id == 1 ? "test" : "group",
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StandartListQuestion(
                      title: initialBranch?.id == 1 ? S.of(context).testlr : S.of(context).blokMrhlsi,
                      buttonTitle: S.of(context).siniflrBax,
                      snapshot: [
                        TypeOption(
                            id: 1, title: S.of(context).quizlr, name: "quiz", imageUrl: "asset/quziler.png"),
                        TypeOption(
                            id: 2, title: S.of(context).testlr, name: "test", imageUrl: "asset/testler.png"),
                        TypeOption(
                            id: 2,
                            title: S.of(context).blokImtahan,
                            name: "",
                            imageUrl: "asset/buraxilis_imtahan blok.png"),
                      ],
                      isGroup: 1,
                      part: 'second',
                      classId: int.tryParse(user.studentClass?.title ?? "") ?? 0,
                      type: initialBranch?.id == 1 ? "test" : "group",
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.tabIcon.withOpacity(0.3), AppColors.tabIcon.withOpacity(0.3)],
                ),
              ),
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.only(left: 20),
              child: Center(
                child: Text(
                  initialBranch?.id == 1 ? S.of(context).testlr : S.of(context).blokMrhlsi,
                  style: TextStyle(
                      color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamScreen(
                  title: S.of(context).mumiSnaqlar,
                  classId: int.tryParse(user.studentClass?.title ?? "") ?? 0,
                  type: "general",
                  subjectId: 0,
                  isGroup: initialBranch?.id == 1 ? 0 : 1,
                ),
              ),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.tabIcon.withOpacity(0.3), AppColors.tabIcon.withOpacity(0.3)],
                ),
              ),
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.only(left: 20),
              child: Center(
                child: Text(
                  S.of(context).mumiSnaqlar,
                  style: TextStyle(
                      color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamScreen(
                  title: S.of(context).msabiqlr,
                  classId: int.tryParse(user.studentClass?.title ?? "") ?? 0,
                  type: "competition",
                  subjectId: 0,
                  isGroup: initialBranch?.id == 1 ? 0 : 1,
                ),
              ),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.tabIcon.withOpacity(0.3), AppColors.tabIcon.withOpacity(0.3)],
                ),
              ),
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.only(left: 20),
              child: Center(
                child: Text(
                  S.of(context).msabiqlr,
                  style: TextStyle(
                      color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
