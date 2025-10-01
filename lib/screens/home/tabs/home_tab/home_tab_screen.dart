import 'package:eduventure/presentation/bloc/error_dispatcher.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:eduventure/screens/home/tabs/home_tab/chat/chat_alert.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_details/widget/video_menu_item.dart';
import 'package:eduventure/screens/home/tabs/home_tab/video/video_navigator.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/children_select.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/home_banner_slider.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/home_user_info.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/packets_item.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/post_item.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/quiz_items.dart';
import 'package:eduventure/screens/home/tabs/home_tab/widget/user_event_table.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../data/network/request/subs_pay_request.dart';
import '../../../../data/network/response/banners_response.dart';
import '../../../../data/network/response/get_posts_response_list.dart';
import '../../../../data/network/response/menu_list_response.dart';
import '../../../../data/network/response/packets_response_list.dart';
import '../../../../data/network/response/settings_response.dart';
import '../../../../data/network/response/type_option.dart';
import '../../../../data/network/response/user.dart';
import '../../../../data/network/response/video_result_response.dart';
import '../../../../generated/l10n.dart';
import '../../../../presentation/bloc/base_screen.dart';
import '../profile_tab/payment/payment_screen.dart';
import '../profile_tab/widget/logout_dialog.dart';
import 'home_tab_bloc.dart';

class HomeTabScreen extends BaseScreen {
  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends BaseState<HomeTabScreen, HomeTabBloc> with ErrorDispatcher {
  TypeOption? quizSelectorId;

  @override
  void initState() {
    super.initState();
    bloc.menuList.then(
      (value) {
        if (mounted) {
          setState(
            () {
              bloc.postId = value.list.first.id;
            },
          );
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (quizSelectorId == null) {
      quizSelectorId = TypeOption(id: 1, name: S.of(context).sinifZr);
    }
  }

  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          return FutureBuilder<SettingsResponse>(
            future: bloc.settings,
            builder: (context, settings) {
             if(settings.hasData){
               return Stack(
                 children: [
                   Container(
                     color: AppColors.bgColor,
                     child: CustomScrollView(
                       slivers: [
                         if (user.requireData.isParent == 0)
                           SliverToBoxAdapter(
                             child: Container(
                               color: user.requireData.isParent == 1
                                   ? AppColors.appColor.withOpacity(0.2)
                                   : Colors.white,
                               child: Stack(
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(bottom: 20),
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                         image: AssetImage(
                                           "asset/home_back.png",
                                         ),
                                         fit: BoxFit.cover,
                                       ),
                                     ),
                                     child: Column(
                                       children: [
                                         HomeUserInfo(
                                           user: user.requireData,
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                                           child: UserEventTable(
                                             user: user.requireData,
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),

                         if (user.requireData.isParent == 1)
                           SliverToBoxAdapter(
                               child: StreamBuilder<int?>(
                                 stream: bloc.userType,
                                 builder: (context, userId) {
                                   if (userId.hasData) {
                                     if (userId.requireData != null) {
                                       return Container(
                                         color: user.requireData.isParent == 1
                                             ? AppColors.appColor.withOpacity(0.2)
                                             : Colors.white,
                                         child: Stack(
                                           children: [
                                             Image.asset(
                                               "asset/home_back.png",
                                               fit: BoxFit.cover,
                                             ),
                                             Column(
                                               children: [
                                                 HomeUserInfo(
                                                   user: user.requireData,
                                                 ),
                                                 Padding(
                                                   padding:
                                                   const EdgeInsets.only(left: 20, right: 20, top: 10),
                                                   child: UserEventTable(
                                                     user: user.requireData.isParent == 1
                                                         ? user.requireData.children!
                                                         .where((e) => e.id == userId.requireData)
                                                         .first
                                                         : user.requireData,
                                                   ),
                                                 )
                                               ],
                                             ),
                                           ],
                                         ),
                                       );
                                     }

                                     return SizedBox();
                                   }
                                   return SizedBox();
                                 },
                               )),

                         if (user.requireData.isParent == 1)
                           SliverToBoxAdapter(
                             child: Container(
                               width: MediaQuery.of(context).size.width,
                               decoration: BoxDecoration(
                                 color: AppColors.appColor.withOpacity(0.2),
                                 borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(20),
                                   bottomRight: Radius.circular(20),
                                 ),
                               ),
                               child: StreamBuilder<int?>(
                                 stream: bloc.userType,
                                 builder: (context, userId) {
                                   if (userId.hasData) {
                                     if (user.requireData.children != []) {
                                       return ChildrenSelector(
                                         branches: user.requireData.children!,
                                         initialBranch: userId.requireData != null
                                             ? user.requireData.children!
                                             .where((e) => e.id == userId.requireData)
                                             .first
                                             : user.requireData.children![0],
                                         onBranchSelected: (User? selectedBranch) {
                                           if (selectedBranch != null) {
                                             setState(() {
                                               bloc.gaveUserId(selectedBranch.id);
                                             });
                                           }
                                         },
                                         title: S.of(context).sinifSein,
                                       );
                                     }
                                   }
                                   return SizedBox();
                                 },
                               ),
                             ),
                           ),

                         FutureBuilder<BannersResponse>(
                           future: bloc.getSlides,
                           builder: (context, snapshot) {
                             if (snapshot.hasData) {
                               if (snapshot.requireData.list.isNotEmpty) {
                                 return SliverToBoxAdapter(
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 20),
                                     child: HomeBannerSlider(
                                       images: snapshot.requireData.list,
                                     ),
                                   ),
                                 );
                               }
                               return SliverToBoxAdapter();
                             }
                             return SliverToBoxAdapter();
                           },
                         ),
                         if (user.requireData.isParent == 0)
                           SliverToBoxAdapter(
                             child: Padding(
                               padding: const EdgeInsets.only(left: 20, top: 10),
                               child: Row(
                                 children: [
                                   Text(
                                     S.of(context).testsnaq,
                                     style: TextStyle(
                                       color: AppColors.textColor,
                                       fontSize: 19,
                                       fontWeight: FontWeight.w700,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         if (user.requireData.isParent != 1)
                           SliverToBoxAdapter(
                             child: SingleChildScrollView(
                               padding: EdgeInsets.only(top: 20),
                               scrollDirection: Axis.horizontal,
                               child: QuizItems(
                                 user: user.requireData,
                                 onBranchSelected: (TypeOption? selectedBranch) {
                                   if (selectedBranch != null) {
                                     setState(() {
                                       quizSelectorId = selectedBranch;
                                     });
                                   }
                                 },
                                 initialBranch: quizSelectorId,
                                 branches: [
                                   TypeOption(id: 1, name: S.of(context).sinifZr),
                                   TypeOption(id: 2, name: S.of(context).qrupZr),
                                 ],
                               ),
                             ),
                           ),

                         if (user.requireData.isParent == 0 && settings.requireData.data.video == 1)
                           SliverToBoxAdapter(
                             child: Padding(
                               padding: const EdgeInsets.only(left: 20, top: 25),
                               child: Row(
                                 children: [
                                   Text(
                                     S.of(context).videodrslr,
                                     style: TextStyle(
                                       color: AppColors.textColor,
                                       fontSize: 19,
                                       fontWeight: FontWeight.w700,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         if (user.requireData.isParent == 0 && settings.requireData.data.video == 1)
                           StreamBuilder<VideoResultResponse>(
                             //Todo hardcore
                             stream: bloc.getVideo((quizSelectorId?.id == 1 ? 0 : 1) ?? 0),
                             builder: (context, snapshot) {
                               if (snapshot.hasData) {
                                 return SliverToBoxAdapter(
                                   child: SizedBox(
                                     height: 140,
                                     child: ListView.builder(
                                       padding: EdgeInsets.only(right: 20),
                                       scrollDirection: Axis.horizontal,
                                       itemCount: snapshot.requireData.results.length,
                                       itemBuilder: (context, index) {
                                         return GestureDetector(
                                           onTap: () {
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                 builder: (context) => VideoNavigator(
                                                   topics: snapshot.requireData.results[index].topics,
                                                   classes: snapshot.requireData.results[index].classes,
                                                   title: snapshot.requireData.results[index].titleAz,
                                                 ),
                                               ),
                                             );
                                           },
                                           child: Container(
                                             width: 250,
                                             child: VideoMenuItem(
                                               titile: snapshot.requireData.results[index].titleAz,
                                               buttonText: S.of(context).daxilOl,
                                             ),
                                           ),
                                         );
                                       },
                                     ),
                                   ),
                                 );
                               }
                               return SliverToBoxAdapter();
                             },
                           ),

                         SliverToBoxAdapter(
                           child: Padding(
                             padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                             child: Row(
                               children: [
                                 Text(
                                   S.of(context).qiymtPlanlar,
                                   style: TextStyle(
                                     color: AppColors.textColor,
                                     fontSize: 19,
                                     fontWeight: FontWeight.w700,
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         // SliverToBoxAdapter(
                         //     child: GestureDetector(
                         //         onTap: () {
                         //           Navigator.push(
                         //             context,
                         //             MaterialPageRoute(
                         //               builder: (context) => VideoButtonScreen(
                         //                 videoUrl: 'https://www.youtube.com/watch?v=BBAyRBTfsOU',
                         //               ),
                         //             ),
                         //           );
                         //         },
                         //         child: Text("data"))),
                         FutureBuilder<PacketsResponseList>(
                           future: bloc.getPackets,
                           builder: (context, snapshot) {
                             if (snapshot.hasData) {
                               if (snapshot.requireData.list.isNotEmpty) {
                                 return SliverToBoxAdapter(
                                   child: Container(
                                     margin: EdgeInsets.only(bottom: 20),
                                     width: 600,
                                     height: 180,
                                     child: ListView.builder(
                                       itemCount: snapshot.requireData.list.length,
                                       padding: EdgeInsets.only(left: 20, right: 20),
                                       scrollDirection: Axis.horizontal,
                                       itemBuilder: (BuildContext context, int index) {
                                         return StreamBuilder<int?>(
                                           stream: bloc.userType,
                                           builder: (context, userId) {
                                             if (userId.hasData) {
                                               if (userId.requireData != null) {
                                                 return GestureDetector(
                                                   onTap: () {
                                                     showDialog(
                                                       context: context,
                                                       builder: (_) {
                                                         return LogoutDialog(
                                                           title:
                                                           S.of(context).buPaketiAlmaqIstdiyinizMinsiniz,
                                                           postDelete: () async {
                                                             bloc
                                                                 .subsPay(
                                                               SubsPayRequest(
                                                                 studentId: userId.requireData ?? 0,
                                                                 packageId:
                                                                 snapshot.requireData.list[index].id,
                                                               ),
                                                             )
                                                                 .then((value) {
                                                               if (value.status == "error") {
                                                                 Navigator.push(
                                                                   context,
                                                                   MaterialPageRoute(
                                                                     builder: (context) {
                                                                       return PaymentScreen(
                                                                         userId: userId.requireData ?? 0,
                                                                         initialPacketId: snapshot
                                                                             .requireData.list[index].id,
                                                                       );
                                                                     },
                                                                   ),
                                                                 );
                                                                 showTopSnackBar(
                                                                   Overlay.of(context),
                                                                   CustomSnackBar.error(
                                                                     icon: Icon(
                                                                       Icons.filter_none,
                                                                       color:
                                                                       Colors.red.withOpacity(0.0),
                                                                     ),
                                                                     message: value.message ?? "",
                                                                   ),
                                                                 );
                                                               }
                                                               if (value.status == "success") {
                                                                 showTopSnackBar(
                                                                   Overlay.of(context),
                                                                   CustomSnackBar.success(
                                                                     icon: Icon(
                                                                       Icons.filter_none,
                                                                       color:
                                                                       Colors.green.withOpacity(0.0),
                                                                     ),
                                                                     message: S.of(context).paketUurlaAlnd,
                                                                   ),
                                                                 );
                                                               }
                                                             });
                                                           },
                                                           desc:
                                                           S.of(context).mvcudPaketinizOlduqdaMddtinZrinLavEdilir,
                                                         );
                                                       },
                                                     );
                                                   },
                                                   child: PacketsItem(
                                                     packetsResponse: snapshot.requireData.list[index],
                                                     packetId:
                                                     user.requireData.latestPurchase?.packageId,
                                                   ),
                                                 );
                                               }
                                               return SizedBox();
                                             }
                                             return GestureDetector(
                                               onTap: () {
                                                 showDialog(
                                                   context: context,
                                                   builder: (_) {
                                                     return LogoutDialog(
                                                       title: S.of(context).buPaketiAlmaqIstdiyinizMinsiniz,
                                                       postDelete: () async {
                                                         bloc
                                                             .subsPay(
                                                           SubsPayRequest(
                                                             studentId: user.requireData.id,
                                                             packageId:
                                                             snapshot.requireData.list[index].id,
                                                           ),
                                                         )
                                                             .then((value) {
                                                           if (value.status == "error") {
                                                             Navigator.push(
                                                               context,
                                                               MaterialPageRoute(
                                                                 builder: (context) {
                                                                   return PaymentScreen(
                                                                     userId: user.requireData.id,
                                                                     initialPacketId: snapshot
                                                                         .requireData.list[index].id,
                                                                   );
                                                                 },
                                                               ),
                                                             );
                                                             showTopSnackBar(
                                                               Overlay.of(context),
                                                               CustomSnackBar.error(
                                                                 icon: Icon(
                                                                   Icons.filter_none,
                                                                   color: Colors.red.withOpacity(0.0),
                                                                 ),
                                                                 message: value.message ?? "",
                                                               ),
                                                             );
                                                           }
                                                           if (value.status == "success") {
                                                             showTopSnackBar(
                                                               Overlay.of(context),
                                                               CustomSnackBar.success(
                                                                 icon: Icon(
                                                                   Icons.filter_none,
                                                                   color: Colors.green.withOpacity(0.0),
                                                                 ),
                                                                 message: S.of(context).paketUurlaAlnd,
                                                               ),
                                                             );
                                                           }
                                                         });
                                                       },
                                                       desc:
                                                       S.of(context).mvcudPaketinizOlduqdaMddtinZrinLavEdilir,
                                                     );
                                                   },
                                                 );
                                               },
                                               child: PacketsItem(
                                                 packetsResponse: snapshot.requireData.list[index],
                                                 packetId: user.requireData.latestPurchase?.packageId,
                                               ),
                                             );
                                           },
                                         );
                                       },
                                     ),
                                   ),
                                 );
                               }
                               return SliverToBoxAdapter();
                             }
                             return SliverToBoxAdapter();
                           },
                         ),
                         FutureBuilder<MenuListResponse>(
                           future: bloc.menuList,
                           builder: (context, snapshot) {
                             if (snapshot.hasData) {
                               if (snapshot.requireData.list.isNotEmpty) {
                                 return SliverToBoxAdapter(
                                   child: SingleChildScrollView(
                                     padding: EdgeInsets.only(top: 20),
                                     scrollDirection: Axis.horizontal,
                                     child: Row(
                                       children: List.generate(
                                         snapshot.requireData.list.length,
                                             (index) {
                                           final item = snapshot.requireData.list[index];
                                           return GestureDetector(
                                             onTap: () {
                                               setState(() {
                                                 bloc.postId = item.id;
                                               });
                                             },
                                             child: Container(
                                               height: 50,
                                               width: MediaQuery.of(context).size.width * 0.27,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(12),
                                                 gradient: LinearGradient(
                                                   begin: Alignment.centerLeft,
                                                   end: Alignment.centerRight,
                                                   colors: bloc.postId == item.id
                                                       ? AppColors.gradient
                                                       : [
                                                     AppColors.tabIcon.withOpacity(0.3),
                                                     AppColors.tabIcon.withOpacity(0.3)
                                                   ],
                                                 ),
                                               ),
                                               padding: const EdgeInsets.only(right: 20, left: 20),
                                               margin: const EdgeInsets.only(left: 20),
                                               child: Center(
                                                   child: Text(
                                                     item.nameAz,
                                                     style: TextStyle(
                                                         color: bloc.postId == item.id
                                                             ? Colors.white
                                                             : AppColors.textColor,
                                                         fontSize: 12,
                                                         fontWeight: FontWeight.w600),
                                                   )),
                                             ),
                                           );
                                         },
                                       ),
                                     ),
                                   ),
                                 );
                               }
                               return SliverToBoxAdapter();
                             }
                             return SliverToBoxAdapter();
                           },
                         ),
                         FutureBuilder<GetPostsResponseList>(
                           future: bloc.getPosts(bloc.postId.toString()),
                           builder: (context, snapshot) {
                             if (snapshot.hasData) {
                               if (snapshot.requireData.list.isNotEmpty) {
                                 return SliverList(
                                   delegate: SliverChildBuilderDelegate(
                                         (_, index) {
                                       final item = snapshot.requireData.list[index];
                                       return PostItem(post: item);
                                     },
                                     childCount: snapshot.requireData.list.length,
                                   ),
                                 );
                               }
                               return SliverToBoxAdapter();
                             }
                             return SliverToBoxAdapter();
                           },
                         ),
                         SliverToBoxAdapter(
                           child: SizedBox(height: 40),
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
             return SizedBox();
            }
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
