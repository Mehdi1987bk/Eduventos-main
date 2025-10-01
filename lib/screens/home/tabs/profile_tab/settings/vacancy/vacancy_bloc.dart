import '../../../../../../data/network/response/vacancies_data.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/base_bloc.dart';

class VacancyBloc  extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<VacanciesData> getVacancies()  async {
    return authRepository.getVacancies();
  }
}