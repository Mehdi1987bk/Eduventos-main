import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../data/network/response/question.dart';
import '../../../../../../../../../main.dart';
import '../../../questions/widget/html_math_parse.dart';

typedef AnswerChanged = void Function(String value, String answerOption);

class ResultQuestionItem extends StatefulWidget {
  final Question question;
  final String? correctAnswer;
  final AnswerChanged onAnswerChanged;

  const ResultQuestionItem({
    super.key,
    required this.question,
    this.correctAnswer,
    required this.onAnswerChanged,
  });

  @override
  State<ResultQuestionItem> createState() => _ResultQuestionItemState();
}

class _ResultQuestionItemState extends State<ResultQuestionItem> {
  late String? selectedAnswer = widget.correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          QuestionButton(
            variant: "A",
            answer: widget.question.Aoption,
            selected: "A" == selectedAnswer,
            isWrong: selectedAnswer == "A" && selectedAnswer != widget.question.correct,
            isCorrect: widget.question.correct == "A",
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "B",
            answer: widget.question.Boption,
            selected: "B" == selectedAnswer,
            isWrong: selectedAnswer == "B" && selectedAnswer != widget.question.correct,
            isCorrect: widget.question.correct == "B",
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "C",
            answer: widget.question.Coption,
            selected: "C" == selectedAnswer,
            isWrong: selectedAnswer == "C" && selectedAnswer != widget.question.correct,
            isCorrect: widget.question.correct == "C",
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "D",
            answer: widget.question.Doption,
            selected: "D" == selectedAnswer,
            isWrong: selectedAnswer == "D" && selectedAnswer != widget.question.correct,
            isCorrect: widget.question.correct == "D",
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "E",
            answer: widget.question.Eoption,
            selected: "E" == selectedAnswer,
            isWrong: selectedAnswer == "E" && selectedAnswer != widget.question.correct,
            isCorrect: widget.question.correct == "E",
            variantType: widget.question.variantType ?? "",
          ),
        ],
      ),
    );
  }
}

class QuestionButton extends StatelessWidget {
  final String answer;
  final bool selected;
  final String variant;
  final bool isCorrect;
  final bool isWrong;
  final String variantType;

  const QuestionButton({
    super.key,
    required this.answer,
    required this.selected,
    required this.variant,
    this.isCorrect = false,
    this.isWrong = false,
    required this.variantType,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;

    if (isCorrect) {
      backgroundColor = AppColors.appGreen.withOpacity(0.5); // ✅
    } else if (isWrong) {
      backgroundColor = Colors.red.withOpacity(0.5); // ❌
    }

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: Text(variant)),
          ),
          const SizedBox(width: 10),
          if (variantType == "image") CachedNetworkImage(imageUrl: baseUrl + answer),
          if (variantType == "text")
            Expanded(
              child: FormulaHtmlWidget(
                html: answer,
              ),
            ),
        ],
      ),
    );
  }
}
