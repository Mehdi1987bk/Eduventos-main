import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/network/response/topics.dart';

class VideoMenuItem extends StatelessWidget {
  final String titile;
  final String buttonText;

  const VideoMenuItem({super.key, required this.titile, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "asset/video_bag.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.topLeft,
            child: Text(
              titile,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(7.0),
              child: Text(
                buttonText ,
                style: TextStyle(
                  color: AppColors.appColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
