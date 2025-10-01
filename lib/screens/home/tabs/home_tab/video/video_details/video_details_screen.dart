import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/widget%20/video_card_item.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/widget%20/video_details_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/network/response/user.dart';
import '../../../../../../data/network/response/videos.dart';
import '../../../../../../generated/l10n.dart';
import '../../home_tab_bloc.dart';
import '../../subjects/exam/questions/widget/html_math_parse.dart';
import '../../subjects/exam/widget/premium_alert.dart';
import '../../widget/video_player_screen.dart';

class VideoDetailsScreen extends BaseScreen {
  final List<Videos> videos;
  final Videos videosDetails;
  final String topicName;

  VideoDetailsScreen(
      {super.key, required this.videos, required this.videosDetails, required this.topicName});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends BaseState<VideoDetailsScreen, HomeTabBloc> {
  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CategoryNavigatorPop(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  widget.videosDetails.titleAz ?? "",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: Text(
                  widget.topicName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CustomYouTubeStylePlayer(
                          videoUrl: widget.videosDetails.playbackUrl ?? "",
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: VideoDetailsItem(
                    videosDetails: widget.videosDetails,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: FormulaHtmlWidget(
                  html: widget.videosDetails.contentAz ?? "",
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                  S.of(context).laqliVideolar,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.videos
                      .where((video) => video.id != widget.videosDetails.id) // удаляем видео с id == 1
                      .map((video) {
                    return GestureDetector(
                      onTap: () {
                        if (video.premiumStatus == 1 &&
                            (user.requireData.subsTime == null || user.requireData.subsTime == 0)) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return PremiumAlert(
                                title: S.of(context).abunlikPaketiTlbOlunur,
                                desc:
                                S.of(context).buImtahanaDaxilOlmaqNAbunlikPaketiAlnmaldrBalansnzArtraraq,
                                user: user.requireData,
                              );
                            },
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return VideoDetailsScreen(
                                  videosDetails: video,
                                  videos: widget.videos,
                                  topicName: widget.topicName,
                                );
                              },
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 30,
                        child: Stack(
                          children: [
                            VideoCardItem(
                              videosDetails: video,
                              topicName: widget.topicName,
                            ),
                            if (video.premiumStatus == 1)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    right: 8,
                                  ),
                                  child: Image.asset(
                                    'asset/premium.png',
                                    width: 20,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  @override
  HomeTabBloc provideBloc() {
    return HomeTabBloc();
  }
}
