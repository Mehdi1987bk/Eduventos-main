import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerScreen extends StatefulWidget {
  final int remainingMinutes; // Изменяем на оставшиеся минуты
  final VoidCallback onTimerFinished;

  const CountdownTimerScreen(
      {Key? key, required this.remainingMinutes, required this.onTimerFinished})
      : super(key: key);

  @override
  _CountdownTimerScreenState createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  late int remainingSeconds;
  late Timer timer;
  Color backgroundColor = Colors.green;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.remainingMinutes * 60;
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (remainingSeconds > 0) {
              remainingSeconds--;
              if (remainingSeconds <= 10) {
                backgroundColor = Colors.red;
              }
            } else {
              timer.cancel();
              widget.onTimerFinished();
            }
          },
        );
      },
    );
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.timer,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(width: 5),
          Text(
            formatTime(remainingSeconds),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
