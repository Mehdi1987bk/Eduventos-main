import 'package:eduventure/presentation/bloc/base_bloc.dart';

import '../../../../../../../data/network/request/exam_id_reqister.dart';
import '../../../../../../../data/network/response/question.dart';
import '../../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../../main.dart';

class StartQuestionsBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  Future<List<Question>> questions(int examId) =>
      authRepository.questions(ExamIdReqister(examId: examId));
}
