import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/splesh/navig_parrent/parrent_navigator_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/network/response/user.dart';
import '../../home/home_screen.dart';
import '../../registration/registration_parrent/student_search/student_search_screen.dart';

class ParrentNavigator extends BaseScreen {
  ParrentNavigator({super.key});

  @override
  State<ParrentNavigator> createState() => _ParrentNavigatorState();
}

class _ParrentNavigatorState extends BaseState<ParrentNavigator, ParrentNavigatorBloc> {
  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          if (user.requireData.isParent == 0) {
            return HomeScreen();
          } else if (user.requireData.isParent == 1 && user.requireData.children?.length == 0) {
            return StudentSearchScreen();
          } else {
            return HomeScreen();
          }
        }
        return SizedBox();
      },
    );
  }

  @override
  ParrentNavigatorBloc provideBloc() {
    return ParrentNavigatorBloc();
  }
}
