import '../../../data/network/request/forgot_password_request.dart';
import '../../../data/network/response/get_otp_code.dart';
import '../../../data/network/response/send_otp_reqister.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../main.dart';
import '../../../presentation/bloc/base_bloc.dart';

class ForgotPasswordBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();
  String dialCode = '55';

  Future<void> sendOtpPassword(SendOtpReqister request) {
    return run(_authRepository.sendOtpPassword(request));
  }

  Future<void> sendRegistrationOtp(String number, String otpCode) {
    return run(_authRepository.sendOtpLogin(number, otpCode));
  }

// Future<void> forgotPassword(
//     String password,
//     String password_confirmation,
//     ) {
//   return run(_authRepository.forgotPassword(ForgotPasswordrRequest(
//       password: password,
//       password_confirmation: password_confirmation)));
// }
}
