import 'package:rxdart/rxdart.dart';

import '../../../../data/network/request/chatbot_request.dart';
import '../../../../data/network/response/chatbot_response.dart';
import '../../../../data/network/response/results_rata.dart';
import '../../../../data/network/response/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../main.dart';
import '../../../../presentation/bloc/base_bloc.dart';

class ResultTabBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();

  late final Stream<int> userType = ValueConnectableStream(authRepository.userType).autoConnect();

  Future<ChatbotResponse> chatbot(String message) => authRepository.chatbot(
    ChatbotRequest(message: message),
  );

  Future<ResultsData> results(
      {required bool subject, required String type, int? subjectId, required int studentId}) {
    return authRepository.results(subject, type, subjectId, studentId);
  }
}
