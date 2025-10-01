import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/response/get_posts_response.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../subjects/exam/questions/widget/html_math_parse.dart';
import '../widget/post_item.dart';

class Post extends StatelessWidget {
  final GetPostsResponse post;

  const Post({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: CategoryNavigatorPop(
                  title: post.titleAz,
                ),
              ),
              Column(
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width - 40,
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    post.image ?? "https://e-deal.az/postImage/default.jpg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width * 0.5 - 40,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.appColor.withOpacity(0.2),
                                  ),
                                  child: Center(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "asset/date_ic.png",
                                            width: 17,
                                            color: AppColors.appColor,
                                          ),
                                          Text(
                                          "  " + formatDay(post.createdAt ?? DateTime.now()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                color: AppColors.appColor),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width * 0.5 - 40,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.appColor.withOpacity(0.2),
                                  ),
                                  child: Center(
                                      child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "asset/eye.png",
                                        width: 17,
                                        color: AppColors.appColor,
                                      ),
                                      Text(
                                        "  " + post.readCount.toString() + " " + S.of(context).bax,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: AppColors.appColor),
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 3, left: 10),
                            width: MediaQuery.of(context).size.width - 40,
                            child: Text(
                              post.titleAz ?? "null",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FormulaHtmlWidget(
                             html:  post.contentAz ?? "",

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
