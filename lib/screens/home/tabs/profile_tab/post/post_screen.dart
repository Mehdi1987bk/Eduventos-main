import 'package:eduventure/presentation/bloc/base_screen.dart';
 import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/post/post_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../app_bloc.dart';
import '../../../../../data/network/response/get_posts_response.dart';
import '../../../../../data/network/response/menu_list_response.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../presentation/bloc/bloc_provider.dart';
import '../../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../../presentation/bloc/utils.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import '../../home_tab/widget/post_item.dart';

class PostScreen extends BaseScreen {
  PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends BaseState<PostScreen, PostBloc> with ErrorDispatcher {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.menuList.then(
      (value) {
        if (mounted) {
          Future.delayed(
            Duration(milliseconds: 500),
            () {
              if (mounted) {
                setState(() {
                  bloc.postId = value.list.first.id;
                  bloc.loadList();
                });
              }
            },
          );
        }
      },
    );
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
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: CategoryNavigatorPop(
                  title: S.of(context).xbrlr,),
              ),
            ),
            FutureBuilder<MenuListResponse>(
              future: bloc.menuList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.requireData.list.isNotEmpty) {
                    return SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 10),
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
                                    bloc.loadList();
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
            StreamBuilder<List<GetPostsResponse>>(
              stream: bloc.paginableList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.requireData.isNotEmpty) {
                    return SliverPadding(
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (_, index) => PostItem(post: snapshot.requireData[index]),
                            childCount: snapshot.requireData.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 220,
                            crossAxisCount: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 30),
                      ),
                      padding: EdgeInsets.only(bottom: 40),
                    );
                  }
                  return FutureBuilder(
                    future: Future.delayed(Duration(seconds: 2)), // Ждём 2 секунды
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SliverToBoxAdapter(
                          child: SizedBox(height: 200), // Можно заменить на лоадер
                        );
                      }
                      return SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 200),
                            Image.asset("asset/search.png", height: 140),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).mlumatTaplmad,
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    },
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
  PostBloc provideBloc() {
    return PostBloc(
      BlocProvider.of<AppBloc>(context).onPacketsAdded,
    );
  }
}
