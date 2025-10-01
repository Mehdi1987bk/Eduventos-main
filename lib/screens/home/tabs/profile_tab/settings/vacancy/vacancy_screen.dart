import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/vacancy/vacancy_bloc.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/vacancy/widget/vacancy_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../data/network/response/vacancies_data.dart';
import '../../../../../../generated/l10n.dart';

class VacancyScreen extends BaseScreen {
  VacancyScreen({super.key});

  @override
  State<VacancyScreen> createState() => _VacancyScreenState();
}

class _VacancyScreenState extends BaseState<VacancyScreen, VacancyBloc> {
  @override
  Widget body() {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only( left: 20, right: 20),
              child: CategoryNavigatorPop(title: S.of(context).vakansiyalar,),
            ),
          ),
          FutureBuilder<VacanciesData>(
            future: bloc.getVacancies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.requireData.list.isNotEmpty) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (_, index) {
                        final item = snapshot.requireData.list[index];
                        return VacancyItem(vacancy: item);
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
        ],
      ),
    );
  }

  @override
  VacancyBloc provideBloc() {
    return VacancyBloc();
  }
}
