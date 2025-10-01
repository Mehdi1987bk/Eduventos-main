import 'package:eduventure/screens/home/tabs/home_tab/notification/widget/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../../../app_bloc.dart';
import '../../../../../data/network/request/approve_notify_request.dart';
import '../../../../../data/network/response/get_notifications.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../presentation/bloc/base_screen.dart';
import '../../../../../presentation/bloc/bloc_provider.dart';
import '../../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../../presentation/bloc/utils.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../../profile_tab/order/widget/category_navigator_pop.dart';
import 'notification_bloc.dart';

class NotificationScreen extends BaseScreen {
  final User user;

  NotificationScreen({super.key, required this.user});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends BaseState<NotificationScreen, NotificationBloc>
    with ErrorDispatcher {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.isParent = int.tryParse(widget.user.isParent.toString()) ?? 0;
    bloc.load();
    _scrollController.addListener(() {
      hideKeyboardOnScroll(context, _scrollController);
      if (_scrollController.position.extentAfter <= MediaQuery.of(context).size.height) {
        bloc.load();
      }
    });
  }

  @override
  Widget body() {
    return SafeArea(
      child: Container(
        color: AppColors.bgColor,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: CategoryNavigatorPop(title: S.of(context).bildirilr),
              ),
            ),
            StreamBuilder<List<GetNotifications>>(
              stream: bloc.paginableList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.requireData.isNotEmpty) {
                    return SliverPadding(
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (_, index) => NotificationItem(
                                  notification: snapshot.requireData[index],
                                  postAccepted: () {
                                    bloc
                                        .approveNotify(ApproveNotifyRequest(
                                          notificationId: snapshot.requireData[index].id,
                                          accept: 1,
                                        ))
                                        .then((value) => bloc.loadList());
                                  },
                                  postDelete: () {
                                    bloc
                                        .approveNotify(
                                          ApproveNotifyRequest(
                                            notificationId: snapshot.requireData[index].id,
                                            accept: 0,
                                          ),
                                        )
                                        .then((value) => bloc.loadList());
                                  },
                                ),
                            childCount: snapshot.requireData.length),
                      ),
                      padding: EdgeInsets.only(bottom: 40),
                    );
                  }
                  return SliverToBoxAdapter(
                    child:   Column(
                      children: [
                        const SizedBox(height: 200),
                        Image.asset(
                          "asset/request.png",
                          width: 150,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            S.of(context).bildiriMvcudDeyil,
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
                    ),
                  );
                }
                return SliverToBoxAdapter();
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  NotificationBloc provideBloc() {
    return NotificationBloc(
      BlocProvider.of<AppBloc>(context).onPacketsAdded,
    );
  }
}
