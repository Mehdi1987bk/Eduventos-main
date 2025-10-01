import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/main.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/questions_bloc.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/widget/countdown_timer_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/widget/html_math_parse.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/widget/navigate_answer.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/widget/progress_bar.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/questions/widget/question_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/network/request/exam.dart';
import '../../../../../../../data/network/response/question.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../profile_tab/widget/logout_dialog.dart';
import '../exam_result/exam_result_screen.dart';

class QuestionsScreen extends BaseScreen {
  final List<Question> questions;
  final Exam exam;
  final int? minute;

  QuestionsScreen({
    super.key,
    required this.questions,
    required this.exam,
    required this.minute,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends BaseState<QuestionsScreen, QuestionsBloc> {
  @override
  Widget body() {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 8.0,
                    ),
                    child: CategoryNavigatorPop(),
                  ),
                  GestureDetector(
                    onTap: () => _showNavigationSheet(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          "asset/category_navigate.png",
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: StreamBuilder<int>(
                    stream: bloc.selectedQuestionIndex,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var question = widget.questions[snapshot.requireData];
                        final index = snapshot.data ?? 0;
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 50,
                                    child: Text(
                                      widget.exam.titleAz ?? "null",
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  if (widget.exam.date != null)
                                    Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      width: MediaQuery.of(context).size.width - 50,
                                      child: Text(
                                        widget.exam.date?.substring(0, 16) ?? "null",
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.help,
                                    color: AppColors.appColorTwo,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    bloc.selections
                                            .where((e) => e.answer != null)
                                            .length
                                            .toString() +
                                        " / " +
                                        widget.questions.length.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: CustomProgressBar(
                                          current:
                                              bloc.selections.where((e) => e.answer != null).length,
                                          total: widget.questions.length),
                                    ),
                                  ),
                                  // Todo timer  CountdownTimerScreen()
                                  // Icon(
                                  //   Icons.access_time_filled,
                                  // )
                                  if (widget.minute != null)
                                    CountdownTimerScreen(
                                      remainingMinutes: widget.minute ?? 0,
                                      onTimerFinished: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return LogoutDialog(
                                              title: S.of(context).mtahanBitirmkIstyirsiniz,
                                              postDelete: () async {
                                                await bloc
                                                    .sendQuestionResult(widget.exam.id)
                                                    .then((value) {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ExamResultScreen(
                                                        answerCount: widget.questions.length,
                                                        resultId: value.result.id,
                                                        answered: value.result.answered,
                                                        unanswered: value.result.unanswered,
                                                        correct: value.result.correct,
                                                        wrong: value.result.wrong,
                                                        resultTime: value.result.time,
                                                        vent: value.vent,
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                              desc:
                                                  S.of(context).mtahanBitirdikdNticlrHesablanrVSonradanDyiiklikEtmkMmknOlmur,
                                            );
                                          },
                                        );
                                      },
                                    )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.appColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                        ),
                                        child: Text(
                                         S.of(context).sual +" " + (index + 1).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      if (question.questionText != null &&
                                          question.questionText != "")
                                        GestureDetector(
                                          onTap: () =>
                                              showCustomAlert(context, question.questionText ?? ""),
                                          child: Container(
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.appColorTwo,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "asset/metn.png",
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  S.of(context).mtn,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                  FormulaHtmlWidget(
                                    html: question.text ?? "null",
                                    fontSize: 15,
                                    colors: Colors.white,
                                  ),
                                  if (question.titleType != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                                      child: Center(
                                        child: CachedNetworkImage(
                                            imageUrl: baseUrl + (question.title ?? "null")),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            QuestionItem(
                              key: ValueKey(snapshot.requireData),
                              answer: bloc.getSelectedQuestion(question.id)?.answer,
                              question: question,
                              onAnswerChanged: (String value, String answerOption) {
                                bloc.onAnswer(question.id, value, answerOption);
                              },
                            ),
                            SizedBox(height: 80),
                          ],
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (bloc.selectedQuestionIndex.value > 0) {
                          bloc.onAnswerChanged(
                              index: bloc.selectedQuestionIndex.value - 1, isLast: false);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.appColor,
                            )),
                        child: Center(
                          child: Text(
                            S.of(context).geri,
                            style: TextStyle(
                                color: AppColors.appColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: StreamBuilder<int>(
                      stream: bloc.selectedQuestionIndex,
                      builder: (context, snapshot) {
                        final index = snapshot.data ?? 0;
                        final isLast = index == (widget.questions.length - 1);

                        return GestureDetector(
                          onTap: () {
                            bloc.onAnswerChanged(index: index + (isLast ? 0 : 1), isLast: isLast);
                            if (isLast) {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return LogoutDialog(
                                    title: S.of(context).mtahanBitirmkIstyirsiniz,
                                    postDelete: () async {
                                      await bloc.sendQuestionResult(widget.exam.id).then((value) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ExamResultScreen(
                                              answerCount: widget.questions.length,
                                              resultId: value.result.id,
                                              answered: value.result.answered,
                                              unanswered: value.result.unanswered,
                                              correct: value.result.correct,
                                              wrong: value.result.wrong,
                                              resultTime: value.result.time,
                                              vent: value.vent,
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    desc:
                                        S.of(context).mtahanBitirdikdNticlrHesablanrVSonradanDyiiklikEtmkMmknOlmur,
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: AppColors.gradient,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                isLast ? S.of(context).bitir : S.of(context).rli,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showCustomAlert(BuildContext context, String desc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7, // максимум 70% экрана
            ),
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
                      child: FormulaHtmlWidget(
                        html: desc,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // закрыть алерт
                    },
                    child: Icon(
                      Icons.close,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showNavigationSheet() async {
    final index = await showModalBottomSheet(
      isScrollControlled: true, // Это позволяет листу занимать всю доступную высоту
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return NavigateAnswer(
          answers: bloc.selections,
          questions: widget.questions,
        );
      },
    );
    if (index != null) {
      bloc.onAnswerChanged(index: index, isLast: false);
    }
  }

  @override
  QuestionsBloc provideBloc() {
    return QuestionsBloc(widget.questions);
  }
}
