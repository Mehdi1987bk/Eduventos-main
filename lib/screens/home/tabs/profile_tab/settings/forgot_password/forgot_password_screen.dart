import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/network/request/update_password_request.dart';
import '../../../../../../domain/entities/patterns.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../presentation/bloc/base_screen.dart';
import '../../../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../../../presentation/common/password_field.dart';
import '../../../../../../presentation/resourses/app_colors.dart';
import '../../../../../login/login_screen.dart';
import '../../order/widget/category_navigator_pop.dart';
import 'forgot_password_bloc.dart';

class ForgotSettingsPasswordScreen extends BaseScreen {
  ForgotSettingsPasswordScreen({super.key});

  @override
  State<ForgotSettingsPasswordScreen> createState() => _ForgotSettingsPasswordScreenState();
}

class _ForgotSettingsPasswordScreenState
    extends BaseState<ForgotSettingsPasswordScreen, ForgotSettingsPasswordBloc>
    with ErrorDispatcher, TickerProviderStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfigController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validate);
    _passwordController.addListener(_validate);
  }

  @override
  Widget body() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          TextTitiles(text: S.of(context).ifr),
          PasswordField(
            labelText: "********",
            controller: _passwordController,
          ),
          const SizedBox(height: 20),
          TextTitiles(text: S.of(context).ifrTkrar),
          PasswordField(
            labelText: "********",
            controller: _passwordConfigController,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _valueNotifier,
            builder: (_, value, __) {
              return Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.only(top: 20, bottom: 5, left: 18, right: 18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: value ? AppColors.gradient : [Colors.grey, Colors.grey],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: value ? _login : null, // Если `false`, отключаем кнопку
                  child: Center(
                    child: Text(
                      S.of(context).tsdiql,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_passwordConfigController.text.trim()) &&
        Patterns.textField.hasMatch(_passwordController.text.trim());

    _valueNotifier.value = isValid;
  }

  @override
  ForgotSettingsPasswordBloc provideBloc() {
    return ForgotSettingsPasswordBloc();
  }

  _login() {
    final password = _passwordController.text.trim();
    final passwordConfigure = _passwordConfigController.text.trim();
    bloc
        .updatePassword(
            UpdatePasswordRequest(password: password, passwordConfirmation: passwordConfigure))
        .then(
      (value) {
        Navigator.pop(context);
        showSuccess(S.of(context).sifrYenilndi, context);
      },
    );
  }
}

void showSuccess(String message, BuildContext context) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50.0,
      left: 20.0,
      right: 20.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
