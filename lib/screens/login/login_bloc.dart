import '../../data/network/request/login_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../main.dart';
import '../../presentation/bloc/base_bloc.dart';

class LoginBlock extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();
  final String num;
  final String pass;
  String dialCode = '55';

  LoginBlock({required this.num, required this.pass});

  Future<void> login(LoginRequest request) {
    return run(_authRepository.login(request));
  }
}
