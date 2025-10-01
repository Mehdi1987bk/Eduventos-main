import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/payment/payment_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/profil_bloc.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/settings_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/widget/circul_statistic.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/widget/info_statistic.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/widget/maniy_statistic.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/widget/statistic_info.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/widget/statistika_widget.dart';
import 'package:flutter/material.dart';

import '../../../../data/network/request/statistics_request.dart';
import '../../../../data/network/response/statistics_response_data.dart';
import '../../../../data/network/response/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../../../presentation/bloc/base_screen.dart';
import '../home_tab/chat/chat_alert.dart';

class ProfileScreen extends BaseScreen {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen, ProfileBloc> {

  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          return Stack(
            children: [
              Container(
                color: AppColors.bgColor,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(0),
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "asset/home_back.png",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image(
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        user.requireData.image ??
                                            "https://e-deal.az/postImage/default.jpg",
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  if(user.requireData.subsTime != null && user.requireData.subsTime != 0)
                                    Column(
                                    children: [
                                      Text( user.requireData.packageName ?? "",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                                      Text( " ( " + (user.requireData.subsTime.toString() ?? "") + " " + S.of(context).gnQald,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (BuildContext context) {
                                        return SettingsScreen();
                                      }));
                                    },
                                    child: Image.asset(
                                      "asset/settings.png",
                                      width: 30,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 55,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            (user.requireData.name ?? "") +
                                                " " +
                                                user.requireData.surname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          if(user.requireData.subsTime != null && user.requireData.subsTime != 0)
                                          Image.asset(
                                            'asset/premium.png',
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        user.requireData.code,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ), Text(
                                        (user.requireData.studentClass?.title.toString() ?? "" )+ S.of(context).sinif,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.appYelloNew,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  StreamBuilder<int?>(
                                    stream: bloc.userType,
                                    builder: (context, userId) {
                                      if (userId.hasData) {
                                        if (userId.requireData != null) {
                                          return GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return PaymentScreen(
                                                    userId: user.requireData.children!
                                                        .where((e) => e.id == userId.requireData)
                                                        .first
                                                        .id,
                                                  );
                                                },
                                              ),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                              ),
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Center(
                                                child: Text(
                                                 S.of(context).balans + " ${user.requireData.children!.where((e) => e.id == userId.requireData).first.balance} " + S.of(context).valut,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return SizedBox();
                                      }
                                      return GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return PaymentScreen(
                                                userId: user.requireData.id,
                                              );
                                            },
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text(
                                             S.of(context).balans + " ${user.requireData.balance} " + S.of(context).valut,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder<int?>(
                      stream: bloc.userType,
                      builder: (context, userId) {
                        if (userId.hasData) {
                          if (userId.requireData != null) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: FutureBuilder<StatisticsResponseData>(
                                future: bloc.statistics(
                                  StatisticsRequest(
                                    userId: user.requireData.children!
                                        .where((e) => e.id == userId.requireData)
                                        .first
                                        .id,
                                    performanceFilter: null,
                                    countFilter: null,
                                    examFilter: null,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final item = snapshot.requireData.data;
                                    return StatisticInfo(item: item);
                                  }
                                  return SizedBox();
                                },
                              ),
                            );
                          }

                          return SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: FutureBuilder<StatisticsResponseData>(
                            future: bloc.statistics(
                              StatisticsRequest(
                                userId: user.requireData.id,
                                performanceFilter: null,
                                countFilter: null,
                                examFilter: null,
                              ),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final item = snapshot.requireData.data;
                                return StatisticInfo(item: item);
                              }
                              return SizedBox();
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 60,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      bloc.chatbot("getchoices").then(
                            (value) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return ChatAlertDialog(
                                 initialResponse: value,
                                user: user.requireData,
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Image.asset("asset/chat_bot.png"),
                  ),
                ),
              )

            ],
          );
        }
        return Text("");
      },
    );
  }

  @override
  ProfileBloc provideBloc() {
    return ProfileBloc();
  }
}
