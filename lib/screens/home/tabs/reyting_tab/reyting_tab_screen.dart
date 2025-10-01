import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:eduventure/screens/home/tabs/reyting_tab/reyting_tab_bloc.dart';
import 'package:eduventure/screens/home/tabs/reyting_tab/widget/reyting_item.dart';
import 'package:eduventure/screens/home/tabs/reyting_tab/widget/reyting_region_selected.dart';
import 'package:flutter/material.dart';
import '../../../../data/network/response/raiting_list.dart';
import '../../../../data/network/response/type_option.dart';
import '../../../../data/network/response/user.dart';
import '../../../../generated/l10n.dart';
import '../home_tab/chat/chat_alert.dart';
import '../profile_tab/order/widget/category_navigator_pop.dart';

class ReytingTabScreen extends BaseScreen {
  ReytingTabScreen({super.key});

  @override
  State<ReytingTabScreen> createState() => _ReytingTabScreenState();
}

class _ReytingTabScreenState extends BaseState<ReytingTabScreen, ReytingTabBloc> {
  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  color: AppColors.bgColor,
                  child: ListView(
                    padding: EdgeInsets.only(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CategoryNavigatorPop(
                          isNavigator: false,
                          title: S.of(context).reytinq,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: FutureBuilder(
                                  future: bloc.getRegions,
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ReytingRegionSelector(
                                        branches: snapshot.requireData,
                                        onBranchSelected: (TypeOption? selectedBranch) {
                                          if (selectedBranch != null) {
                                            setState(() {
                                              bloc.regions = selectedBranch;
                                            });
                                          }
                                        },
                                        title: S.of(context).regionSein,
                                      );
                                    }
                                    return SizedBox();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: FutureBuilder(
                                  future: bloc.reytingExam,
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ReytingRegionSelector(
                                        branches: snapshot.requireData,
                                        onBranchSelected: (TypeOption? selectedBranch) {
                                          if (selectedBranch != null) {
                                            setState(() {
                                              bloc.excam = selectedBranch;
                                            });
                                          }
                                        },
                                        title: S.of(context).imtahanSein,
                                      );
                                    }
                                    return SizedBox();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<RaitingList>(
                        future: bloc
                            .getRaiting(int.tryParse(user.requireData.studentClass?.title ?? "") ?? 0),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                           if(snapshot.requireData.list.isNotEmpty){
                             var filteredList = snapshot.requireData.list;

                             return ListView.builder(
                               padding: EdgeInsets.only(left: 20, right: 20),
                               shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                               itemCount: filteredList.length,
                               itemBuilder: (BuildContext context, int index) {
                                 return ReytingItem(
                                   item: filteredList[index],
                                 );
                               },
                             );
                           } return  Column(
                             children: [
                               const SizedBox(height: 200),
                               Image.asset(
                                 "asset/tex_not.png",
                                 width: 150,
                               ),
                               const SizedBox(height: 24),
                               SizedBox(
                                 width: double.infinity,
                                 child: Text(
                                   S.of(context).reytinqTaplmad,
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 17,
                                     fontFamily: 'SF Pro',
                                     fontWeight: FontWeight.w600,
                                     height: 1.29,
                                     letterSpacing: -0.43,
                                   ),
                                 ),
                               ),

                             ],
                           );
                          }
                          return SizedBox();
                        },
                      ),
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
                ),
              ],
            ),
          );
        }
        return Text("");
      },
    );
  }

  @override
  ReytingTabBloc provideBloc() {
    return ReytingTabBloc();
  }
}
