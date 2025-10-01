import 'package:eduventure/screens/home/tabs/profile_tab/profil_screen.dart';
import 'package:eduventure/screens/home/tabs/result_tab/result_tab_screen.dart';
import 'package:eduventure/screens/home/tabs/reyting_tab/reyting_tab_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/network/response/type_option.dart';
import '../../generated/l10n.dart';
import '../../presentation/bloc/base_screen.dart';
import 'bottom_bar.dart';
import 'home_bloc.dart';
import 'tabs/home_tab/home_tab_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class HomeScreen extends BaseScreen {
  final int? orderId;
  final int? initialTabIndex;

  HomeScreen({super.key, this.orderId, this.initialTabIndex});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeBloc> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> optionsNotifier = ValueNotifier(false);
   late int _selectedIndex = widget.initialTabIndex ?? 0;

  @override
  void dispose() {
    optionsNotifier.dispose();
    super.dispose();
  }



  @override
  Widget body() {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          _Tabs(
            selectedIndex: _selectedIndex,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        onChanged: (index) async {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
      ),
    );
  }

  @override
  HomeBloc provideBloc() {
    return HomeBloc();
  }

  _showOptions() {
    optionsNotifier.value = !optionsNotifier.value;
  }
}

class _Tabs extends StatefulWidget {
  final int selectedIndex;

  _Tabs({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  __TabsState createState() => __TabsState();
}

class __TabsState extends State<_Tabs> {
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = <Widget>[
      HomeTabScreen(),
      ResultTabScreen(
       ),      ReytingTabScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _tabs[widget.selectedIndex];
  }
}
