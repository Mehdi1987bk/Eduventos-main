import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/widget%20/video_details_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/network/response/videos.dart';

class VideoCardItem extends StatelessWidget {
  final Videos videosDetails;
  final   String topicName;

  const VideoCardItem({super.key, required this.videosDetails, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoDetailsItem(
            videosDetails: videosDetails,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
            child: Text(
              videosDetails.titleAz ?? "",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Text(
              topicName ,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
