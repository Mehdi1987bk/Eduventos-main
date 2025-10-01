import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/resourses/app_colors.dart';
import '../screens/login/login_screen.dart';
import 'data.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final ValueNotifier<double> _notifier = ValueNotifier(0);
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _notifier.value = _controller.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = OnboardingItems.loadItem()!.length;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: totalPages,
              itemBuilder: (BuildContext context, int index) {
                final oi = OnboardingItems.loadItem()![index];
                return Container(
                  child: Column(
                    children: [
                      InfoData(
                        image: oi.image,
                        subTitle: oi.subTitle,
                        color: oi.color,
                        title: oi.title,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: _notifier,
            builder: (BuildContext context, value, Widget? child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150, left: 16),
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: value,
                    decorator: DotsDecorator(
                      color: AppColors.appColor.withOpacity(0.4),
                      size: const Size.square(10.0),
                      activeSize: const Size(15.0, 15.0),
                      activeColor: OnboardingItems.loadItem()![_controller.page?.toInt() ?? 0].color,
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      )),
      floatingActionButton: ValueListenableBuilder<double>(
        valueListenable: _notifier,
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            padding: const EdgeInsets.only(left: 30, bottom: 40),
            child: GestureDetector(
              onTap: () {
                if (_controller.page == 2) {
                  Navigator.pushReplacement(
                      context, CupertinoPageRoute(builder: (BuildContext context) => LoginScreen()));
                } else {
                  _controller.nextPage(curve: Curves.ease, duration: const Duration(milliseconds: 350));
                }
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: OnboardingItems.loadItem()![_controller.page?.toInt() ?? 0].color,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    _controller.page == 2 ? "Başla" : "İrəli",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InfoData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Color color;

  InfoData({required this.title, required this.subTitle, required this.image, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => OnBoardingScreen())),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, right: 20, top: 40),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Keç",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: AppColors.textColor),
                  )),
            ),
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, bottom: 6, top: 30),
              child: Text(
                title,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 6,
              ),
              width: double.infinity,
              child: Text(
                subTitle,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
