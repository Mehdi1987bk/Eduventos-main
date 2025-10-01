import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/resourses/app_colors.dart';

class OnboardingItem {
  final String title;
  final String subTitle;
  final String image;
  final Color color;

  OnboardingItem(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.color});
}

class OnboardingItems {
  static List<OnboardingItem>? loadItem() {
    final fi = <OnboardingItem>[
      OnboardingItem(
          title: 'Xoş gəlmisiniz!',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare in elit volutpat gravida venenatis aliquam duis faucibus.',
          image: "asset/groop1.png",
          color: AppColors.appColor),
      OnboardingItem(
          title: 'Kredit müraciəti',
          subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare in elit volutpat gravida venenatis aliquam duis faucibus.',
          image: "asset/groop2.png",
          color: AppColors.appColor),
      OnboardingItem(
          title: 'Kredit əldə et',
          subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare in elit volutpat gravida venenatis aliquam duis faucibus.',
          image: "asset/groop3.png",
          color: AppColors.appColor),
    ];
    return fi;
  }
}
