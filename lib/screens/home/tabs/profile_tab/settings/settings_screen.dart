import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/parrent_edit/parrent_edit_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/settings_bloc.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/student_edit/student_edit_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/telim/telim_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/vacancy/vacancy_screen.dart';
import 'package:eduventure/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/network/response/instructions_data.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../generated/l10n.dart';
import '../../../../login/forgot_password/forgot_password_screen.dart';
import '../post/post_screen.dart';
import '../widget/logout_dialog.dart';
import '../widget/menu_item.dart';
import 'contact_us/contact_us_screen.dart';
import 'forgot_password/forgot_password_screen.dart';

class SettingsScreen extends BaseScreen {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseState<SettingsScreen, SettingsBloc> {
  @override
  Widget body() {
    return StreamBuilder<User>(
      stream: bloc.userDetails,
      builder: (context, user) {
        if (user.hasData) {
          return SafeArea(
            child: Container(
              color: AppColors.bgColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: CategoryNavigatorPop(
                      title: S.of(context).tnzimlmlr,
                    ),
                  ),
                  SizedBox(height: 15),
                  MenuItem(
                    title: S.of(context).xsiMlumatlar,
                    icon: "asset/prof_1.png",
                    padd: 35,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            if (user.requireData.isParent == 1) {
                              return ParrentEditScreen(
                                user: user.requireData,
                              );
                            }
                            return StudentEditScreen(
                              user: user.requireData,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  MenuItem(
                    title: S.of(context).ifrniDyi,
                    icon: "asset/prof_2.png",
                    padd: 35,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ForgotSettingsPasswordScreen();
                          },
                        ),
                      );
                    },
                  ),
                  // MenuItem(
                  //   title: "Təlimatlar",
                  //   icon: "asset/prof_2.png",
                  //   padd: 35,
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (BuildContext context) {
                  //           return TelimScreen();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  MenuItem(
                    title: S.of(context).xbrlr,
                    icon: "asset/prof_7.png",
                    padd: 35,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return PostScreen();
                          },
                        ),
                      );
                    },
                  ),
                  MenuItem(
                    title: S.of(context).vakansiyalar,
                    icon: "asset/prof_3.png",
                    padd: 35,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return VacancyScreen();
                          },
                        ),
                      );
                    },
                  ),
                  MenuItem(
                    title: S.of(context).dstk,
                    icon: "asset/prof_4.png",
                    padd: 35,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ContactUsScreen();
                          },
                        ),
                      );
                    },
                  ),
                  MenuItem(
                    title: S.of(context).mxfilikSiyasti,
                    icon: "asset/prof_4.png",
                    padd: 35,
                    onTap: () => _launchPhone("https://eduventos.az/privacy-policy"),
                  ),
                  MenuItem(
                    title: S.of(context).profiliSil,
                    icon: "asset/prof_5.png",
                    padd: 35,
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) {
                        return LogoutDialog(
                          title: S.of(context).hesabSilmkIstdiyinizMinsiniz,
                          postDelete: () async {
                            await bloc.logout.then(
                              (value) {
                                return Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return LoginScreen();
                                    },
                                  ),
                                  (route) => false,
                                );
                              },
                            );
                          },
                          desc:
                              S.of(context).hesabSildikdBuHesabaDairBtnTamamlanmImtahanVDigr,
                        );
                      },
                    ),
                  ),
                  MenuItem(
                    title: S.of(context).x,
                    icon: "asset/prof_6.png",
                    padd: 35,
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) {
                        return LogoutDialog(
                          title: S.of(context).hesabdanXEtmkIstyirsiniz,
                          postDelete: () async {
                            await bloc.logout.then(
                              (value) {
                                return Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return LoginScreen();
                                    },
                                  ),
                                  (route) => false,
                                );
                              },
                            );
                          },
                          desc: '',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Text("");
      },
    );
  }

  @override
  SettingsBloc provideBloc() {
    return SettingsBloc();
  }

  Future<void> _launchPhone(String url) async {
    if (!await launch("$url")) {
      throw 'Could not launch';
    }
  }
}
