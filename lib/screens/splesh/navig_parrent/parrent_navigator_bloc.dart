import 'package:eduventure/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/network/response/user.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../main.dart';

class ParrentNavigatorBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  @override
  void init() {
    super.init();
    authRepository.getUserDetails();
  }

  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();
}
