import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/video_details_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/widget%20/video_card_item.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/user.dart';
import '../../../../../data/network/response/videos.dart';
import '../../profile_tab/order/widget/category_navigator_pop.dart';
import '../home_tab_bloc.dart';
import '../subjects/exam/widget/premium_alert.dart';
import '../widget/video_player_screen.dart';

class VideoList extends BaseScreen {
  final List<Videos> videos;
  final String topicName;

  VideoList({super.key, required this.videos, required this.topicName});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends BaseState<VideoList, HomeTabBloc> {
  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CategoryNavigatorPop(
                    title: widget.topicName,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.videos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (widget.videos[index].premiumStatus == 1 &&
                        (user.requireData.subsTime == null || user.requireData.subsTime == 0)){
                          showDialog(
                            context: context,
                            builder: (_) {
                              return PremiumAlert(
                                title: "Abunəlik paketi tələb olunur",
                                desc:
                                'Bu imtahana daxil olmaq üçün abunəlik paketi alınmalıdır. Balansınızı artıraraq abunəlik paketi əldə edə bilərsiniz.',
                                user: user.requireData,
                              );
                            },
                          );
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return VideoDetailsScreen(
                                  videosDetails: widget.videos[index],
                                  videos: widget.videos,
                                  topicName: widget.topicName,
                                );
                              },
                            ),
                          );
                        }


                      },
                      child: Stack(
                        children: [

                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            child: VideoCardItem(
                              videosDetails: widget.videos[index],
                              topicName: widget.topicName,
                            ),
                          ),
                          if (widget.videos[index].premiumStatus == 1)
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  right: 30,
                                ),
                                child: Image.asset(
                                  'asset/premium.png',
                                  width: 20,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
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
