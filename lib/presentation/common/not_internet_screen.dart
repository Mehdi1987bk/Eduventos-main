import 'dart:io';

import 'package:eduventure/screens/splesh/splesh_screen.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../resourses/app_colors.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 250),
                Image.asset(
                  "asset/tex_not.png",
                  width: 150,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    S.of(context).nternetQoulmad,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      height: 1.29,
                      letterSpacing: -0.43,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    S.of(context).nternetdProblemMvcuddurZhmtOlmasaYenidnSnayn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      height: 1.29,
                      letterSpacing: -0.43,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, bottom: 5, left: 30, right: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: AppColors.gradient,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  final hasInternet = await checkInternetConnection();
                  if (hasInternet) {
                    print("интернет есть");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),
                    );
                  } else {
                    print("интернета нет");
                  }
                },
                child: Center(
                  child: Text(
                    S.of(context).qountunuYoxla,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
