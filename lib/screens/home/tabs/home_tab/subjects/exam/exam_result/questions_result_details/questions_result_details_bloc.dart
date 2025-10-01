import '../../../../../../../../data/network/response/ai_generate_response.dart';
import '../../../../../../../../data/network/response/result_details_answers.dart';
import '../../../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../../../main.dart';
import '../../../../../../../../presentation/bloc/base_bloc.dart';

class QuestionsResultDetailsBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<ResultDetailsAnswers> resultDetails(int resultId) =>
      run(authRepository.resultDetails(resultId));

  Future<AiGenerateResponse> aiQuestion(int questionId) =>
      run(authRepository.aiQuestion(questionId));
}