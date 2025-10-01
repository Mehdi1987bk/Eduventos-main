import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../../../presentation/resourses/app_colors.dart';
import '../../../questions/widget/html_math_parse.dart';

class TypingAlertDialog extends StatefulWidget {
  final String text;

  const TypingAlertDialog({required this.text, super.key});

  @override
  State<TypingAlertDialog> createState() => _TypingAlertDialogState();
}

class _TypingAlertDialogState extends State<TypingAlertDialog> {
  String _visibleText = '';
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if (_currentIndex >= widget.text.length) {
        _timer.cancel();
      } else {
        setState(() {
          _visibleText += widget.text[_currentIndex];
          _currentIndex++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8),
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
          FormulaHtmlWidget(html: _visibleText),
        ],
      )),

    );
  }
}
