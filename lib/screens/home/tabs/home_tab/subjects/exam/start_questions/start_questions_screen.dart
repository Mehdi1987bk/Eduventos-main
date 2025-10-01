import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/start_questions/start_questions_bloc.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../data/network/request/exam.dart';
import '../../../../../../../data/network/response/question.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../presentation/resourses/app_colors.dart';
import '../questions/questions_screen.dart';
import '../questions/widget/html_math_parse.dart';
import '../widget/not_alert.dart';

class StartQuestions extends BaseScreen {
  final Exam exam;
  final String title;

  StartQuestions({
    super.key,
    required this.exam,
    required this.title,
  });

  @override
  State<StartQuestions> createState() => _StartQuestionsState();
}

class _StartQuestionsState extends BaseState<StartQuestions, StartQuestionsBloc> {
  final PublishSubject<void> onPacketsAdded = PublishSubject();
  late DateTime targetTime = DateTime.tryParse(widget.exam.date.toString() ?? "") ?? DateTime.now();
  final examImages = {
    "quiz": "asset/exam1.png",
    "test": "asset/exam2.png",
    "competition": "asset/exam3.png",
    "general": "asset/exam4.png",
  };

  @override
  Widget body() {
    return SafeArea(
      child: FutureBuilder<List<Question>>(
        future: bloc.questions(widget.exam.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: CategoryNavigatorPop(
                    title: widget.title,
                  ),
                ),
                const SizedBox(height: 220),
                Image.asset(
                  "asset/tex_not.png",
                  width: 150,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    S.of(context).suallarYerldirilir,
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
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    S.of(context).buMvzuZrSuallarQsaMddtYerldirilckdir,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      height: 1.29,
                      letterSpacing: -0.43,
                    ),
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasData) {
            final imagePath = examImages[widget.exam.type] ?? "asset/az-min.png";

            return Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: CategoryNavigatorPop(
                        title: widget.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: widget.exam.image == "https://eduventos.az/postImage/noPhoto.png" ||
                                widget.exam.image == "postImage/noPhoto.png"
                            ? Image.asset(imagePath)
                            : CachedNetworkImage(imageUrl: widget.exam.image ?? "null"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 27, right: 20, top: 20),
                      child: Text(widget.exam.titleAz ?? "null",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600,
                            height: 1.29,
                            letterSpacing: -0.43,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: FormulaHtmlWidget(
                        html: widget.exam.contentAz ?? "null",
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.appColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.help, size: 18, color: AppColors.appColorTwo),
                          SizedBox(width: 4),
                          Text(
                            '${widget.exam.count} sual',
                            style: TextStyle(color: AppColors.appColorTwo),
                          ),
                          if (widget.exam.minute != null)
                            Row(children: [
                              SizedBox(width: 8),
                              Text(" / ", style: TextStyle(color: AppColors.appColorTwo)),
                              SizedBox(width: 8),
                              Icon(Icons.access_time_filled,
                                  size: 18, color: AppColors.appColorTwo),
                              SizedBox(width: 4),
                              Text(
                                '${widget.exam.minute} deq.',
                                style: TextStyle(color: AppColors.appColorTwo),
                              ),
                            ])
                        ],
                      ),
                    ),
                    if (widget.exam.date != null)
                      Container(
                        height: 45,
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.appColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                S.of(context).balamaTarixi +
                                    ' ' +
                                    DateFormat("yyyy-MM-dd HH:mm").format(targetTime),
                                style: TextStyle(color: AppColors.appColorTwo),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => _checkTime(snapshot.requireData, widget.exam.minute ?? 0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: AppColors.gradientGreen,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).testBala,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  @override
  StartQuestionsBloc provideBloc() {
    return StartQuestionsBloc();
  }

  void _checkTime(List<Question> questions, int minut) {
    DateTime targetTime = DateTime.tryParse(widget.exam.date.toString() ?? "") ?? DateTime.now();
    DateTime currentTime = DateTime.now();

    // Добавляем минуты к targetTime
    DateTime endTime = targetTime.add(Duration(minutes: minut));
    int minutesLeft = endTime.difference(currentTime).inMinutes;

    if (widget.exam.date == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionsScreen(
            questions: questions,
            exam: widget.exam,
            minute: widget.exam.minute ?? null,
          ),
        ),
      );
    } else {
      if (currentTime.isBefore(targetTime)) {
        // Экзамен еще не начался
        showDialog(
          context: context,
          builder: (_) {
            return NotAlert(
              title: S.of(context).buImtahanHlBalamamdr,
              postDelete: () async {},
              desc: S.of(context).balamaTarixi +
                  ' ' +
                  DateFormat("yyyy-MM-dd HH:mm").format(targetTime),
            );
          },
        );
      } else if (currentTime.isAfter(endTime)) {
        showDialog(
          context: context,
          builder: (_) {
            return NotAlert(
              title: S.of(context).mtahanBitmidir,
              postDelete: () async {},
              desc: S.of(context).bitmTarixi + " ${DateFormat("yyyy-MM-dd HH:mm").format(endTime)}",
            );
          },
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionsScreen(
              questions: questions,
              exam: widget.exam,
              minute: minutesLeft,
            ),
          ),
        );
      }
    }
  }
}
