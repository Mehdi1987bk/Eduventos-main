import '../../../../../../data/network/request/update_password_request.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/base_bloc.dart';

class ForgotSettingsPasswordBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<void> updatePassword(UpdatePasswordRequest request) async {
    await run(authRepository.updatePassword(request));
  }
}
