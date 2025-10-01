import 'package:flutter/material.dart';
import '../../../../domain/entities/patterns.dart';
import '../../../../generated/l10n.dart';
import '../../../../presentation/bloc/base_screen.dart';
import '../../../../presentation/common/password_field.dart';
import '../../../../presentation/resourses/app_colors.dart';
import '../../../registration/widget/navigator_pop.dart';
 import '../forgot_password_bloc.dart';

class ForgotPasswordScreen extends BaseScreen {
  final String number;

  ForgotPasswordScreen({Key? key, required this.number}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseState<ForgotPasswordScreen, ForgotPasswordBloc> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordTwoController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validate);
    _passwordTwoController.addListener(_validate);
  }

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          NavigatorPop(),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  S.of(context).ifrniziBrpaEdin,
                  style: TextStyle(
                      color: AppColors.textColor, fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28, left: 35, right: 35),
                child: Text(
                  S.of(context).yeniIfrniziTyinEdin,
                  style: TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: PasswordField(
              labelText: S.of(context).ifr,
              controller: _passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
            child: PasswordField(
              labelText: S.of(context).tkrarIfr,
              controller: _passwordTwoController,
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, bottom: 5, left: 18, right: 18),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: ValueListenableBuilder<bool>(
              valueListenable: _valueNotifier,
              builder: (_, value, __) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: AppColors.appColor.withOpacity(0.3),
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      backgroundColor: AppColors.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: value ? _stepTow : null,
                  child: Text(
                    S.of(context).daxilOl,
                    style: TextStyle(
                        color: value ? Colors.white : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  ForgotPasswordBloc provideBloc() {
    return ForgotPasswordBloc();
  }

  @override
  void dispose() {
    _passwordTwoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validate() {
    final isValid = Patterns.password.hasMatch(_passwordTwoController.text.trim()) &&
        Patterns.password.hasMatch((_passwordController.text.trim())) &&
        _passwordController.text.trim() == _passwordTwoController.text.trim();
    _valueNotifier.value = isValid;
  }

  _stepTow() {
    final password = _passwordController.text;
    // bloc.forgotPassword(password, password).then((value) {
    //   if (mounted) {
    //     showTopSnackBar(
    //       Overlay.of(context)!,
    //       CustomSnackBar.success(
    //         icon: Icon(
    //           Icons.filter_none,
    //           color: Colors.green.withOpacity(0.0),
    //         ),
    //         message: "Şifrəniz uğurla dəyişdirildi!",
    //       ),
    //     );
    //     return Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    //   }
    //
    // }
    // );
  }
}
