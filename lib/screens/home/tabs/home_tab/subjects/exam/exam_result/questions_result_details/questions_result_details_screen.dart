import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/home_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/exam_result/questions_result_details/questions_result_details_bloc.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/exam_result/questions_result_details/widget/answer_izah.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/exam_result/questions_result_details/widget/result_questions_answers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../data/network/response/question_result_response.dart';
import '../../../../../../../../data/network/response/result_details.dart';
import '../../../../../../../../data/network/response/result_details_answers.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../../../../main.dart';
import '../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../profile_tab/order/widget/category_navigator_pop.dart';
import '../../../../home_tab_screen.dart';
import '../../questions/widget/html_math_parse.dart';

class QuestionsResultDetailsScreen extends BaseScreen {
  final int resultId;

  QuestionsResultDetailsScreen({
    super.key,
    required this.resultId,
  });

  @override
  State<QuestionsResultDetailsScreen> createState() => _QuestionsResultDetailsScreenState();
}

class _QuestionsResultDetailsScreenState
    extends BaseState<QuestionsResultDetailsScreen, QuestionsResultDetailsBloc> {
  @override
  Widget body() {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: CategoryNavigatorPop(
                  title: S.of(context).nticlr,
                ),
              ),
              FutureBuilder<ResultDetailsAnswers>(
                future: bloc.resultDetails(widget.resultId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.answers.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final question = snapshot.requireData.answers[index].question;

                        return Container(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          margin: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          S.of(context).sual + " " + (index + 1).toString(),
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        _getResultText(snapshot.requireData.answers[index]),
                                        Spacer(),
                                        if (question.questionText != null &&
                                            question.questionText != "")
                                          GestureDetector(
                                            onTap: () => showCustomAlert(
                                                context, question.questionText ?? ""),
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
                                    FormulaHtmlWidget(html: question.text ?? "null"),
                                    if (snapshot.requireData.answers[index].question.titleType !=
                                        null)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CachedNetworkImage(
                                            imageUrl: baseUrl + (question.title ?? "null")),
                                      ),
                                  ],
                                ),
                              ),
                              ResultQuestionItem(
                                correctAnswer: snapshot.requireData.answers[index].studentAnswer,
                                question: snapshot.requireData.answers[index].question,
                                onAnswerChanged: (String value, String answerOption) {},
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  bloc
                                      .aiQuestion(snapshot.requireData.answers[index].questionId)
                                      .then(
                                    (value) {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return TypingAlertDialog(text: value.description);
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: AppColors.gradient,
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(S.of(context).sualnIzah,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)))),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
          Positioned(
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen())),
                child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
              ),
              right: 0,
              bottom: 0),
        ],
      ),
    );
  }

  Widget _getResultText(ResultDetails answer) {
    final studentAnswer = answer.studentAnswer;
    final correctAnswer = answer.question.correct;

    String text;
    Color color;

    if (studentAnswer == null || studentAnswer.isEmpty) {
      text = S.of(context).cavabsz;
      color = Colors.orangeAccent;
    } else if (studentAnswer == correctAnswer) {
      text = S.of(context).dzgn;
      color = Colors.green;
    } else {
      text = S.of(context).shv;
      color = Colors.red;
    }

    return Text(
      "  (" + text + ")",
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 17,
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

  @override
  QuestionsResultDetailsBloc provideBloc() {
    return QuestionsResultDetailsBloc();
  }
}
