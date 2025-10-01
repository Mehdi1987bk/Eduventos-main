import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/exam_result/exam_result_bloc.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/exam_result/questions_result_details/questions_result_details_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/network/response/question_result_response.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../presentation/resourses/app_colors.dart';
import '../questions/widget/html_math_parse.dart';

class ExamResultScreen extends BaseScreen {
  final int answerCount;
  final int resultId;
  final int answered;
  final int unanswered;
  final int correct;
  final int wrong;
  final int resultTime;
  final double? vent;

  ExamResultScreen({
    super.key,
    required this.answerCount,
    required this.resultId,
    required this.answered,
    required this.unanswered,
    required this.correct,
    required this.wrong,
    required this.resultTime,
    this.vent,
  });

  @override
  State<ExamResultScreen> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends BaseState<ExamResultScreen, ExamResultBloc> {
  @override
  void initState() {
    super.initState();
    bloc.aiGenerateResponse(widget.resultId).then((value) {
      showCustomAlert(context, value.description ?? "");
    });
  }

  @override
  Widget body() {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: CategoryNavigatorPop(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    S.of(context).mtahanNticlri,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: Text(
                  S.of(context).mtahanUurlaBitirdinizNticlrIlAadaTanOlaBilrsiniz,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (widget.vent != 0.0 && widget.vent != null)
                Container(
                  margin: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.appColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/vent_icon.png",
                        width: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Text(
                          widget.vent.toString() + " " + S.of(context).vent,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ResultMiniInfo(
                        image: "asset/result_5.png",
                        title: "${widget.answered}/${widget.answerCount}",
                        desc: S.of(context).cavablandrlmSuallar,
                      ),
                    ),
                    Expanded(
                      child: ResultMiniInfo(
                        image: "asset/result_1.png",
                        title: "${widget.unanswered}/${widget.answerCount}",
                        desc: S.of(context).cavablandrlmamSuallar,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ResultMiniInfo(
                        image: "asset/result_2.png",
                        title: "${widget.correct}",
                        desc: S.of(context).doruCavablar,
                      ),
                    ),
                    Expanded(
                      child: ResultMiniInfo(
                        image: "asset/result_3.png",
                        title: "${widget.wrong}",
                        desc: S.of(context).yanlCavablar,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ResultMiniInfo(
                        image: "asset/result_4.png",
                        title: "${formatTime(widget.resultTime)} " + S.of(context).dq,
                        desc: S.of(context).mtahanMddti,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      bloc.aiGenerateResponse(widget.resultId).then((value) {
                        showCustomAlert(context, value.description ?? "");
                      });
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 10),
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
                          S.of(context).analizBax,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsResultDetailsScreen(
                          resultId: widget.resultId,
                        ),
                      ),
                    ),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 20),
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
                          S.of(context).nticlrBax,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ExamResultBloc provideBloc() {
    return ExamResultBloc();
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
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 24,
                        color: AppColors.appColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            S.of(context).mtnSniIntellektTrfindnYaradlb,
                            style: TextStyle(color: AppColors.textColor, fontSize: 11),
                          )),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(); // закрыть алерт
                        },
                        child: Icon(
                          Icons.close,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 10),
                      child: FormulaHtmlWidget(
                        html: desc,
                      ),
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

  String formatTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;

    return '$minutes.${seconds.toString().padLeft(2, '0')}';
  }
}

class ResultMiniInfo extends StatelessWidget {
  final String image;
  final String title;
  final String desc;

  const ResultMiniInfo({super.key, required this.image, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              title,
              style:
                  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
                color: Colors.grey.withOpacity(0.8), fontWeight: FontWeight.w400, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
