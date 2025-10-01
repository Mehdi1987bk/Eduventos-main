import 'package:eduventure/presentation/bloc/base_bloc.dart';

import '../../../../data/network/response/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../main.dart';

class StudentSearchBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  User? student;

  Future<User?> searchStudent(String code) => _authRepository.searchStudent(code);

  Future<void> selectStudentForParent(int id) => _authRepository.selectStudentForParent(id);
}
