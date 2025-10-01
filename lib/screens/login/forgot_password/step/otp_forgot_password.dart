import 'package:eduventure/screens/registration/registration_parrent/widget/pin_kode_button.dart';
import 'package:eduventure/screens/registration/registration_student/registration_student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../data/network/response/type_option.dart';
import '../../../../generated/l10n.dart';
import '../../../../presentation/bloc/base_screen.dart';
import '../../../../presentation/bloc/error_dispatcher.dart';
import '../../../../presentation/resourses/app_colors.dart';
import '../../../home/home_screen.dart';
import '../../../home/tabs/profile_tab/order/widget/category_navigator_pop.dart';
import '../../../splesh/navig_parrent/parrent_navigator.dart';
import '../forgot_password_bloc.dart';

class OtpForgotPassword extends BaseScreen {
  final String phone;

  OtpForgotPassword({
    required this.phone,
  });

  @override
  State<OtpForgotPassword> createState() => _OtpForgotPasswordState();
}

class _OtpForgotPasswordState extends BaseState<OtpForgotPassword, ForgotPasswordBloc>
    with ErrorDispatcher {
  @override
  Widget body() {
    return Container(
      color: AppColors.appBarbgColor,
      child: ListView(
        children: [

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Text(
                S.of(context).otpKodunuTsdiqlyin,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24,color: AppColors.appColorTwo),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Center(
              child: Text(
                "${widget.phone}  " + S.of(context).nmrsinKodGndrdikXahiEdirik4RqmliKoduDaxilEdrk,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.textColor.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 40, bottom: 30),
            child: Text(
              "${widget.phone}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.appBarbgColor.withOpacity(0.6),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 70,
              child: PinInputField(
                codeLength: 4,
                onCodeChanged: (code) {
                  if (code.length == 4) {
                    bloc.dialCode = code;
                    _sendPin();
                  }
                },
              ),
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

  _sendPin() {
    bloc
        .sendRegistrationOtp(
       widget.phone,
  bloc.dialCode,
    )
        .then(
      (value) {
        if (mounted) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              icon: Icon(
                Icons.filter_none,
                color: Colors.green.withOpacity(0.0),
              ),
              message: S.of(context).qeydiyyatUurlaTamamland,
            ),
          );
          return Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (BuildContext context) => ParrentNavigator()));
        }
      },
    );
  }
}
