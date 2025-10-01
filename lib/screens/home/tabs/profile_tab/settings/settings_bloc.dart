import 'package:rxdart/rxdart.dart';

import '../../../../../data/network/response/instructions_data.dart';
import '../../../../../data/network/response/user.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/base_bloc.dart';

class SettingsBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();
  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();

  late final Future<void> logout = authRepository.logout();

}
