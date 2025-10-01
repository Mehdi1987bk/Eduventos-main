import 'dart:convert';
import 'dart:io';

import 'package:rxdart/rxdart.dart';

import '../../../data/network/request/registration_request.dart';
import '../../../data/network/response/get_otp_code.dart';
import '../../../data/network/response/send_otp_reqister.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../main.dart';
import '../../../presentation/bloc/base_bloc.dart';

class RegistrationParrentBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  final PublishSubject<File> userAvatar = PublishSubject();
  late String code;
  String dialCode = '55';

  Future<GetOtpCode> sendOtpRegister(SendOtpReqister request) {
    return run(_authRepository.sendOtpRegister(request));
  }

  Future<void> registration({
    required String name,
    required String password,
    required String phone,
    required String sername,
    required String otpCode,
  }) {
    return run(
      _authRepository.checkOtpRegister(
        RegistrationRequest(
          name: name,
          phoneNumber: phone,
          password: password,
          surname: sername,
          isParent: "1",
          otpCode: otpCode,
        ),
      ),
    );
  }
}
