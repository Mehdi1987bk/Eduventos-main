import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/exam/widget/exam_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../data/network/request/exam.dart';
import '../../../../../../data/network/response/user.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../../../presentation/bloc/utils.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import 'exam_bloc.dart';

class ExamScreen extends BaseScreen {
  final String title;
  final int classId;
  final int subjectId;
  final String type;
  final String? part;
  final int? isGroup;

  ExamScreen({
    super.key,
    required this.title,
    required this.classId,
    required this.subjectId,
    required this.type,
    this.isGroup,
    this.part,
  });

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends BaseState<ExamScreen, ExamBloc>
    with ErrorDispatcher, SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final PublishSubject<void> onPacketsAdded = PublishSubject();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      bloc.onSearch(textEditingController.text.trim());
    });
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
      child:
      StreamBuilder<User>(
        stream: bloc.userDetails,
        builder: (context, user) {
          if (user.hasData) {
            return   Container(
              color: AppColors.appBarbgColor,
              child: RefreshIndicator(
                onRefresh: () => bloc.load(refresh: true),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                          child: CategoryNavigatorPop(title: widget.title),
                        )),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                  child: TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      hintText: S.of(context).axtar,
                                      prefixIcon: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: SvgPicture.asset(
                                            "asset/home_search.svg",
                                          )),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(44),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    StreamBuilder<List<Exam>>(
                      stream: bloc.paginableList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.requireData.isNotEmpty) {
                            return SliverPadding(
                              padding: const EdgeInsets.only(bottom: 40),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                      (_, index) {
                                    final item = snapshot.requireData[index];
                                    return ExamItem(
                                      exam: item,
                                      classId: widget.classId,
                                      type: widget.type,
                                      subjectId: widget.subjectId,
                                      title: widget.title,
                                      user: user.requireData,
                                    );
                                  },
                                  childCount: snapshot.requireData.length,
                                ),
                              ),
                            );
                          }
                          return SliverToBoxAdapter(
                            child: Column(
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
                                    S.of(context).tezlikl,
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
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    S.of(context).buBlmdTezliklImtahanYerldirilckdir,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
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
          return Text("");
        },
      )

    );
  }

  @override
  ExamBloc provideBloc() {
    return ExamBloc(
        onReflash: onPacketsAdded,
        subjectId: widget.subjectId,
        classId: widget.classId,
        type: widget.type,
        part: widget.part,
        isGroup: widget.isGroup);
  }
}
