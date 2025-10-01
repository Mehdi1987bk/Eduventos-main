import 'package:eduventure/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../data/network/request/chatbot_request.dart';
import '../../../../data/network/request/raiting_request.dart';
import '../../../../data/network/response/chatbot_response.dart';
import '../../../../data/network/response/raiting_list.dart';
import '../../../../data/network/response/reyting_exam_response.dart';
import '../../../../data/network/response/type_option.dart';
import '../../../../data/network/response/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../main.dart';

class ReytingTabBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  TypeOption? regions;
  TypeOption? excam;
  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();

  late final Future<List<TypeOption>> getRegions = authRepository.getRegions();

  late final Future<List<TypeOption>> reytingExam = authRepository.reytingExam();

  Future<ChatbotResponse> chatbot(String message) => authRepository.chatbot(
    ChatbotRequest(message: message),
  );

  Future<RaitingList> getRaiting(int classId) async {
    return authRepository.getRaiting(
        RaitingRequest(examId: excam?.id ?? null, regionId: regions?.id ?? null, classId: classId));
  }
}
