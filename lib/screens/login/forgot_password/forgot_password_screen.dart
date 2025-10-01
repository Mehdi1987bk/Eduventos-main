import 'package:eduventure/presentation/bloc/error_dispatcher.dart';
import 'package:eduventure/screens/home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import 'package:eduventure/screens/login/forgot_password/step/otp_forgot_password.dart';
import 'package:flutter/material.dart';

import '../../../data/network/response/send_otp_reqister.dart';
import '../../../domain/entities/patterns.dart';
import '../../../generated/l10n.dart';
import '../../../presentation/bloc/base_screen.dart';
import '../../../presentation/common/input_text.dart';
import '../../../presentation/common/phone_number_field.dart';
import '../../../presentation/resourses/app_colors.dart';
import '../../registration/widget/navigator_pop.dart';
import '../login_screen.dart';
import 'forgot_password_bloc.dart';

class ForgotPasswordScreen extends BaseScreen {
  @override
  _ForgotPasswordStepOneState createState() => _ForgotPasswordStepOneState();
}

class _ForgotPasswordStepOneState extends BaseState<ForgotPasswordScreen, ForgotPasswordBloc>
    with ErrorDispatcher {
  final TextEditingController _phoneController = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validate);
  }

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CategoryNavigatorPop(
              title: S.of(context).parolSfrla,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextTitiles(text: S.of(context).laqNmr),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 55,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(0.3))),
                child: DropdownSelector(
                  values: dialCodes,
                  onChanged: (String value) {
                    bloc.dialCode = value;
                  },
                ),
              ),
              Expanded(
                child: PhoneNumberField(
                  controller: _phoneController,
                  labelText: "***-**-**",
                  autofocus: true,
                ),
              ),
            ],
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, bottom: 5, left: 18, right: 18),
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
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: value ? _login : null,
                  child: Text(
                    S.of(context).koduGndr,
                    style: TextStyle(
                      color: value ? Colors.white : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
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
    _phoneController.dispose();
    super.dispose();
  }

  void _validate() {
    var isValid = Patterns.textField.hasMatch(_phoneController.text.trim());
    _valueNotifier.value = isValid;
  }

  _login() {
    final phone = "+994" + bloc.dialCode + _phoneController.text.trim();
    bloc.sendOtpPassword(SendOtpReqister(phoneNumber: phone, isParent: 0)).then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => OtpForgotPassword(
                phone: phone,
              ),
            ),
          ),
        );
  }
}
