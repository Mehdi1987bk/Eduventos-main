import 'dart:io'; // Добавь это в начало файла
import 'package:flutter/material.dart';

class CategoryNavigatorPop extends StatelessWidget {
  final String? title;
  final bool isNavigator;

  const CategoryNavigatorPop({super.key, this.title, this.isNavigator = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Platform.isAndroid ? 20.0 : 0.0,
      ),
      child: Row(
        children: [
          if (isNavigator == true)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                "asset/arrow.png",
                width: 30,
              ),
            ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width - 150,
            child: Text(
              title ?? "",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
