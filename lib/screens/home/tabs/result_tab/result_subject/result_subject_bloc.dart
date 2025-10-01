import '../../../../../data/network/response/results_rata.dart';
import '../../../../../domain/repositories/auth_repository.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/base_bloc.dart';

class SubjectsResultBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<ResultsData> results({required bool subject, required String type, int? subjectId, required int studentId}) {
    return authRepository.results(subject, type, subjectId,studentId);
  }
}
