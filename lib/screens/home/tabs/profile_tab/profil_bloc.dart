import 'package:eduventure/data/network/response/statistics_response_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../data/network/request/chatbot_request.dart';
import '../../../../data/network/request/statistics_request.dart';
import '../../../../data/network/response/chatbot_response.dart';
import '../../../../data/network/response/statistics_response.dart';
import '../../../../data/network/response/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../main.dart';
import '../../../../presentation/bloc/base_bloc.dart';

class ProfileBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();
  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();

  late final Future<void> logout = authRepository.logout();
  late final Stream<int> userType = ValueConnectableStream(authRepository.userType).autoConnect();

  Future<ChatbotResponse> chatbot(String message) => authRepository.chatbot(
    ChatbotRequest(message: message),
  );

  Future<StatisticsResponseData> statistics(StatisticsRequest request) =>
      authRepository.statistics(request);
}
