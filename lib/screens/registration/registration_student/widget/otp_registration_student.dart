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
import '../../../splesh/navig_parrent/parrent_navigator.dart';

class OtpStudentScreen extends BaseScreen {
  final String name;
  final String isParent;
  final String password;
  final String phone;
  final String sername;
  final String fatherName;
  final String? promoCode;
  final TypeOption classId;
  final TypeOption regionId;
  final TypeOption languageId;
  final TypeOption groupId;

  OtpStudentScreen({
    required this.isParent,
    required this.name,
    required this.password,
    required this.phone,
    required this.sername,
    required this.fatherName,
    required this.classId,
    required this.regionId,
    required this.languageId,
    required this.groupId,
    this.promoCode,
  });

  @override
  State<OtpStudentScreen> createState() => _OtpStudentScreenState();
}

class _OtpStudentScreenState extends BaseState<OtpStudentScreen, RegistrationStudentBloc>
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
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 24, color: AppColors.appColorTwo),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
            child: Center(
              child: Text(
                "${widget.phone} " + S.of(context).nmrsinKodGndrdikXahiEdirik4RqmliKoduDaxilEdrk,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.textColor.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
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
                    bloc.code = code;
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
  RegistrationStudentBloc provideBloc() {
    return RegistrationStudentBloc();
  }

  _sendPin() {
    bloc
        .registration(
      isParent: widget.isParent,
      name: widget.name,
      password: widget.password,
      phone: widget.phone,
      sername: widget.sername,
      otpCode: bloc.code,
      fatherName: widget.fatherName,
      language: widget.languageId,
      clas: widget.classId,
      regions: widget.regionId,
      groupId: widget.groupId,
      promoCode: widget.promoCode,
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
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                if (widget.isParent == '1') {
                  return ParrentNavigator();
                }
                return ParrentNavigator();
              },
            ),
          );
        }
      },
    );
  }
}
