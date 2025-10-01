import 'package:eduventure/presentation/bloc/base_screen.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/settings/contact_us/widget/contact_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../data/network/response/settings_response.dart';
import '../../../../../../generated/l10n.dart';
import '../../order/widget/category_navigator_pop.dart';
import 'contact_us_bloc.dart';

class ContactUsScreen extends BaseScreen {
  ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends BaseState<ContactUsScreen, ContactUsBloc> {
  @override
  Widget body() {
    return SafeArea(
      child: FutureBuilder<SettingsResponse>(
        future: bloc.settings,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                    title: S.of(context).dstk,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(children: [
                        ContactItem(
                          title: S.of(context).instagram,
                          icon: "asset/cont_1.png",
                          buttonTitle: S.of(context).keid,
                          onTap: () => _launchUrl(snapshot.requireData.data.instagram ?? ""),
                        ),
                        Spacer(),
                        ContactItem(
                          title: S.of(context).facebook,
                          icon: "asset/cont_2.png",
                          buttonTitle: S.of(context).keid,
                          onTap: () => _launchUrl(snapshot.requireData.data.facebook ?? ""),
                        ),
                      ]),
                      SizedBox(height: 15),
                      Row(children: [
                        ContactItem(
                          title: S.of(context).linkedin,
                          icon: "asset/cont_3.png",
                          buttonTitle: S.of(context).keid,
                          onTap: () => _launchUrl(snapshot.requireData.data.linkedin ?? ""),
                        ),
                        Spacer(),
                        ContactItem(
                          title: S.of(context).epot,
                          icon: "asset/cont_4.png",
                          buttonTitle: S.of(context).keid,
                          onTap: () => _launchEmail(snapshot.requireData.data.email ?? ""),
                        ),
                      ]),
                      SizedBox(height: 15),
                      Row(children: [ 
                        ContactItem(
                          title: S.of(context).telefon,
                          icon: "asset/cont_5.png",
                          buttonTitle: S.of(context).keid,
                          onTap: () => _launchPhone(snapshot.requireData.data.phone ?? ""),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  @override
  ContactUsBloc provideBloc() {
    return ContactUsBloc();
  }

  Future<void> _launchPhone(String url) async {
    if (!await launch("tel://$url")) {
      throw 'Could not launch';
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launch("$url")) {
      throw 'Could not launch';
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch email client';
    }
  }
}
