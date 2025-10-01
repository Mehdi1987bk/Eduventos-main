import '../../../../../../data/network/response/settings_response.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/base_bloc.dart';

class ContactUsBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  late final Future<SettingsResponse> settings = authRepository.settings();
}
