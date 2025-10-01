import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/widget/video_menu_item.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_list.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/classes.dart';
import '../../../../../data/network/response/topics.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';

import '../../../../../generated/l10n.dart';

class VideoNavigator extends StatelessWidget {
  final List<Topics>? topics;
  final List<Classes>? classes;
  final String title;

  VideoNavigator({super.key, this.topics, this.classes, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CategoryNavigatorPop(
                  title: title,
                ),
              ),
              if (classes != null && classes!.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: classes!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoNavigator(
                              topics: classes?[index].topics, title: (classes?[index].title ?? "") + S.of(context).sinif,
                            ),
                          ),
                        );
                      },
                      child: VideoMenuItem(
                        titile: (classes?[index].title ?? "") + S.of(context).sinif, buttonText: S.of(context).mvzularaBax,
                      ),
                    );
                  },
                ),

              if (topics != null && topics!.isNotEmpty)
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: topics!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoList(
                              videos: topics![index].videos,
                              topicName: topics?[index].titleAz ?? "",
                            ),
                          ),
                        );
                      },
                      child: VideoMenuItem(
                        titile: topics?[index].titleAz ?? "", buttonText: S.of(context).videolaraBax,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
