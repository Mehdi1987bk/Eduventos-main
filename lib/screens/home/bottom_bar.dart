import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../presentation/resourses/app_colors.dart';

class BottomBar extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  const BottomBar({super.key, required this.onChanged, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  onChanged(0);
                },
                icon: SvgPicture.asset(
                  'asset/but_1.svg',
                  color: selectedIndex == 0 ? AppColors.appColor : null,
                  height: 30,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  onChanged(1);
                },
                icon: SvgPicture.asset(
                  'asset/but_2.svg',
                  color: selectedIndex == 1 ? AppColors.appColor : null,
                  height: 25,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  onChanged(2);
                },
                icon: SvgPicture.asset(
                  'asset/but_3.svg',
                  color: selectedIndex == 2 ? AppColors.appColor : null,
                  height: 30,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  onChanged(3);
                },
                icon: SvgPicture.asset(
                  'asset/but_4.svg',
                  color: selectedIndex == 3 ? AppColors.appColor : null,
                  height: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
