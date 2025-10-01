import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/result_tab/result_subject/result_exam/result_exam_screen.dart';
import 'package:eduventure/screens/home/tabs/result_tab/result_subject/result_subject_screen.dart';
import 'package:eduventure/screens/home/tabs/result_tab/result_tab_bloc.dart';
import 'package:eduventure/screens/home/tabs/result_tab/widget/result_tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/network/response/type_option.dart';
import '../../../../data/network/response/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../home_tab/chat/chat_alert.dart';
import '../home_tab/subjects/widget/subjects_item.dart';
import '../profile_tab/order/widget/category_navigator_pop.dart';

class ResultTabScreen extends BaseScreen {
  ResultTabScreen({
    super.key,
  });

  @override
  State<ResultTabScreen> createState() => _ResultTabScreenState();
}

class _ResultTabScreenState extends BaseState<ResultTabScreen, ResultTabBloc> {
  final snapshot = [
    TypeOption(
        id: 1, title: 'Quizlər', name: "quiz", imageUrl: "asset/quziler.png", boolParams: true),
    TypeOption(
        id: 2, title: 'Testlər', name: "test", imageUrl: "asset/testler.png", boolParams: true),
    TypeOption(
        id: 3,
        title: 'Buraxılış/Blok imtahanları',
        imageUrl: "asset/buraxilis_imtahan blok.png",
        name: "group",
        boolParams: false),
    TypeOption(
        id: 4,
        title: 'Ümumi sınaqlar',
        name: "general",
        imageUrl: "asset/umumi_sinaq.png",
        boolParams: false),
    TypeOption(
        id: 5,
        title: 'Müsabiqələr',
        name: "competition",
        imageUrl: "asset/mьsabiqeler.png",
        boolParams: false),
  ];

  @override
  Widget body() {
    return SafeArea(
      child: StreamBuilder<User>(
        stream: bloc.userDetails,
        builder: (context, user) {
          if (user.hasData) {
            return Stack(
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: CategoryNavigatorPop(
                        isNavigator: false,
                        title: S.of(context).nticlr,
                      ),
                    ),
                  ],
                ),
                StreamBuilder<int?>(
                  stream: bloc.userType,
                  builder: (context, userId) {
                    if (userId.hasData) {
                      final childrenList = user.requireData.children ?? [];
                      final matchingChild = childrenList.where((e) => e.id == userId.data).toList();

                      if (matchingChild.isNotEmpty) {
                        return ResultTabItem(
                          snapshot: snapshot,
                          bloc: bloc,
                          userId: matchingChild.first.id,
                          user: user.requireData,
                        );
                      }
                    }
                    return ResultTabItem(
                      snapshot: snapshot,
                      bloc: bloc,
                      userId: user.requireData.id,
                      user: user.requireData,
                    );
                  },
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
          return SizedBox();
        },
      ),
    );
  }

  @override
  ResultTabBloc provideBloc() {
    return ResultTabBloc();
  }
}
