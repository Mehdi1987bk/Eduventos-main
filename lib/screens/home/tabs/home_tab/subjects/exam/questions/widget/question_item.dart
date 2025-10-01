import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../data/network/response/question.dart';
import '../../../../../../../../main.dart';
import 'html_math_parse.dart';

typedef AnswerChanged = void Function(String value, String answerOption);

class QuestionItem extends StatefulWidget {
  final Question question;
  final String? answer;
  final AnswerChanged onAnswerChanged;

  const QuestionItem({
    super.key,
    required this.question,
    this.answer,
    required this.onAnswerChanged,
  });

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  late String? selectedAnswer = widget.answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: Column(
        children: [
          QuestionButton(
            variant: "A",
            answer: widget.question.Aoption,
            selected: widget.question.Aoption == selectedAnswer,
            onAnswerChanged: (value) => _onAnswerChanged(value, "A"),
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "B",
            answer: widget.question.Boption,
            selected: widget.question.Boption == selectedAnswer,
            onAnswerChanged: (value) => _onAnswerChanged(value, "B"),
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "C",
            answer: widget.question.Coption,
            selected: widget.question.Coption == selectedAnswer,
            onAnswerChanged: (value) => _onAnswerChanged(value, "C"),
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "D",
            answer: widget.question.Doption,
            selected: widget.question.Doption == selectedAnswer,
            onAnswerChanged: (value) => _onAnswerChanged(value, "D"),
            variantType: widget.question.variantType ?? "",
          ),
          QuestionButton(
            variant: "E",
            answer: widget.question.Eoption,
            selected: widget.question.Eoption == selectedAnswer,
            onAnswerChanged: (value) => _onAnswerChanged(value, "E"),
            variantType: widget.question.variantType ?? "",
          ),
        ],
      ),
    );
  }

  void _onAnswerChanged(String value, String answerOption) {
    setState(() {
      selectedAnswer = value;
      widget.onAnswerChanged(value, answerOption);
    });
  }
}

class QuestionButton extends StatelessWidget {
  final String answer;
  final bool selected;
  final String variant;
  final String variantType;
  final ValueChanged<String> onAnswerChanged;

  const QuestionButton({
    super.key,
    required this.answer,
    required this.selected,
    required this.onAnswerChanged,
    required this.variant,
    required this.variantType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAnswerChanged(answer),
      child: Container(
        margin: EdgeInsets.only(top: 10,left: 12, right: 12),
        padding: EdgeInsets.only(left: 20, right: 20 ),
        decoration: BoxDecoration(
          color: selected ? AppColors.appColor.withOpacity(0.5) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.appColor.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: selected ? Colors.white : Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text(variant)),
            ),
            SizedBox(
              width: 10,
            ),
            if(variantType == "image")
            CachedNetworkImage(imageUrl: baseUrl + answer),
            if(variantType == "text")
              Expanded(
              child: FormulaHtmlWidget(
                html: answer,
                fontSize: 14,
                colors: selected ? Colors.white : Colors.black,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
