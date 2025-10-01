import '../../../../../data/network/request/subjects_request.dart';
import '../../../../../data/network/response/type_option.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/base_bloc.dart';

class SubjectsBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  Future<List<TypeOption>> getSubjects(SubjectsRequest request) => _authRepository.getSubjects(request);
}
