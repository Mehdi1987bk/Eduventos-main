import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/subjects_bloc.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/widget/classes_list.dart';
import 'package:eduventure/screens/home/tabs/home_tab/subjects/widget/subjects_item.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:flutter/material.dart';

import '../../../../../data/network/request/subjects_request.dart';
import '../../../../../data/network/response/type_option.dart';
import '../../../../../presentation/resourses/app_colors.dart';
import 'exam/exam_screen.dart';

class SubjectsScreen extends BaseScreen {
  final String title;
  final String buttonTitle;
  final String? buttonTitleChild;
  final String elaveTitle;
  final int isGroup;
  final String part;
  final int classId;
  final String type;

  SubjectsScreen({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.elaveTitle,
    required this.isGroup,
    required this.part,
    required this.classId,
    required this.type,
    this.buttonTitleChild,
  });

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends BaseState<SubjectsScreen, SubjectsBloc> {
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
            if (snapshot.hasData) {
              final subjects = snapshot.requireData;

              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: CategoryNavigatorPop(
                      title: widget.title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: subjects.map((item) {
                        return SizedBox(
                          width: (MediaQuery.of(context).size.width - 2 * 20 - 10) / 2,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExamScreen(
                                  title: item.title ?? "",
                                  classId: int.tryParse(item.title ?? "") ?? 0,
                                  type: widget.type,
                                  subjectId: item.id,
                                ),
                              ),
                            ),
                            child: SubjectsItem(
                              title: "${item.title ?? ""} ${widget.elaveTitle}",
                              buttonTitle: widget.buttonTitle,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ClassesList(
                                    buttonTitle: widget.buttonTitleChild,
                                    title: item.title ?? "",
                                    subjects: item.subjects ?? [],
                                    type: widget.type,
                                    classId: int.tryParse(item.title ?? "") ?? 0,
                                  ),
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

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  SubjectsBloc provideBloc() {
    return SubjectsBloc();
  }
}
