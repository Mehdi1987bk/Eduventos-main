import '../../../../../../../data/network/response/ai_generate_response.dart';
import '../../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../../main.dart';
import '../../../../../../../presentation/bloc/base_bloc.dart';

class ExamResultBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<AiGenerateResponse> aiGenerateResponse(int resultId) =>
      run(authRepository.aiGenerateResponse(resultId));
}
