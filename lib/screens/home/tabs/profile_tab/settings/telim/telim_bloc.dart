import '../../../../../../data/network/response/instructions_data.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/base_bloc.dart';

class TelimBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<InstructionsData> instructions() => authRepository.instructions();
}
