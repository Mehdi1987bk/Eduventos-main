import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../../data/network/response/videos.dart';

class VideoDetailsItem extends StatelessWidget {
  final Videos videosDetails;

  const VideoDetailsItem({super.key, required this.videosDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              videosDetails.image ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.appColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
