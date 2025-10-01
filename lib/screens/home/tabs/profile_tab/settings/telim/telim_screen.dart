import 'package:eduventure/presentation/bloc/base_bloc.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/telim/telim_bloc.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/telim/widget/youtube_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/network/response/instructions_data.dart';
import '../../../../../../generated/l10n.dart';
import '../../widget/menu_item.dart';

class TelimScreen extends BaseScreen {
  TelimScreen({super.key});

  @override
  State<TelimScreen> createState() => _TelimScreenState();
}

class _TelimScreenState extends BaseState<TelimScreen, TelimBloc> {
  @override
  Widget body() {
    return Column(
      children: [
        CategoryNavigatorPop(
          title: S.of(context).tlim,
        ),
        FutureBuilder<InstructionsData>(
          future: bloc.instructions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return ListView.builder(
              //   shrinkWrap: true,
              //    scrollDirection: Axis.vertical,
              //    itemCount: snapshot.requireData.data?.length,
              //   itemBuilder: (context, index) {
              //     return Text("data");
              //   },
              // );
              // return YoutubeAlert(url: snapshot.requireData.data?.video ?? "",);
            }
            return SizedBox();
          },
        ),
      ],
    );
  }

  @override
  TelimBloc provideBloc() {
    return TelimBloc();
  }
}
