import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/subjects_bloc.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/widget/subjects_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/network/request/subjects_request.dart';
import '../../../../../../data/network/response/type_option.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import '../exam/exam_screen.dart';

class SubjectsIsGroup0 extends BaseScreen {
  final String title;
  final String buttonTitle;
  final String elaveTitle;
  final int isGroup;
  final String part;
  final int classId;
  final String type;

  SubjectsIsGroup0({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.elaveTitle,
    required this.isGroup,
    required this.part,
    required this.classId,
    required this.type,
  });

  @override
  State<SubjectsIsGroup0> createState() => _SubjectsIsGroup0State();
}

class _SubjectsIsGroup0State extends BaseState<SubjectsIsGroup0, SubjectsBloc> {
  @override
  Widget body() {
    return SafeArea(
      child: Container(
        color: AppColors.bgColor,
        child: FutureBuilder<List<TypeOption>>(
          future: bloc.getSubjects(
            SubjectsRequest(
              isGroup: widget.isGroup,
              part: widget.part,
            ),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(S.of(context).xtaBaVerdi +' ${snapshot.error}'));
            }

            if (snapshot.hasData) {
              final allSubjects =
                  snapshot.requireData.expand((option) => option.subjects ?? []).toList();

              return ListView(
                padding: const EdgeInsets.only(bottom: 20, top: 0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: CategoryNavigatorPop(
                      title: widget.title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: allSubjects.map((item) {
                        return SizedBox(
                          width: (MediaQuery.of(context).size.width - 2 * 20 - 10) / 2,
                          child: SubjectsItem(
                            isColorBack: false,
                            image: item.image,
                             title: item.titleAz ?? "",
                            buttonTitle: widget.buttonTitle,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExamScreen(
                                  title: item.titleAz ?? "",
                                  classId: widget.classId,
                                  type: widget.type,
                                  subjectId: item.id ?? 0,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox(); // fallback
          },
        ),
      ),
    );
  }

  @override
  SubjectsBloc provideBloc() => SubjectsBloc();
}
