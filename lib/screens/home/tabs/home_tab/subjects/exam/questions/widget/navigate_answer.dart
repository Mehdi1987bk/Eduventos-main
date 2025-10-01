import 'package:collection/collection.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../data/network/request/answers.dart';
import '../../../../../../../../data/network/response/question.dart';
import '../../../../../../../../generated/l10n.dart';

const double _itemDiametr = 40;
const double _itemPadding = 20;

class NavigateAnswer extends StatelessWidget {
  final Set<QuestionSelection> answers;
  final List<Question> questions;

  const NavigateAnswer({super.key, required this.answers, required this.questions});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: 200),
          padding: EdgeInsets.all(_itemPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Row(children: [
                  Text(
                    S.of(context).suallar,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
              Wrap(
                spacing: _itemPadding,
                runSpacing: _itemPadding,
                children: questions
                    .mapIndexed(
                      (index, e) => GestureDetector(
                        onTap: () => Navigator.pop(context, index),
                        child: NavigateAnswerItem(
                          index: index,
                          isSelected: answers.firstWhereOrNull(
                                (element) => element.questionId == e.id,
                              )?.answer != null,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigateAnswerItem extends StatelessWidget {
  final int index;
  final bool isSelected;

  const NavigateAnswerItem({super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.appColor : AppColors.appColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.appColor),
      ),
      child: Center(
        child: Text("${index + 1}",
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.appColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
