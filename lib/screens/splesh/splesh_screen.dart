import 'package:flutter/material.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../main.dart';
import '../login/login_screen.dart';
import 'navig_parrent/parrent_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    var authRepository = sl.get<AuthRepository>();

    await Future.delayed(const Duration(seconds: 3));

    bool isLogged = await authRepository.isLogged();
    bool isFirstOpen = await authRepository.firstOpen();

    if (isFirstOpen) {
      await authRepository.setIsFirstOpen();
      _navigateToScreen(LoginScreen());
    } else if (isLogged) {
      _navigateToScreen(ParrentNavigator());
    } else {
      _navigateToScreen(LoginScreen());
      // _navigateToScreen(HomeScreen());
    }
  }

  void _navigateToScreen(Widget screen) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Image.asset(
            'asset/logo.png',
            fit: BoxFit.fitWidth,
            width: 210,
          ),
        ),
      ),
    );
  }
}
