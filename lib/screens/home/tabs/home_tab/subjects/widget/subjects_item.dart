import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduventure/presentation/resourses/app_colors.dart';
import 'package:flutter/material.dart';

class SubjectsItem extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onTap;
  final String? image;
  final String? imageLocale;
  final bool? isColorBack;

  const SubjectsItem({
    super.key,
    required this.title,
    this.image,
    this.imageLocale,
    required this.buttonTitle,
    required this.onTap,
    this.isColorBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
             margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
             ),
            child: Center(
              child: imageLocale != null ? Image.asset(imageLocale!) : (image != null
                  ? CachedNetworkImage(imageUrl: image ?? "")
                  : Image.asset("asset/clas_ic.png")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(top: 15, bottom: 20, left: 20, right: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: AppColors.gradientGreen,
                ),
              ),
              height: 40,
              child: Center(
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
