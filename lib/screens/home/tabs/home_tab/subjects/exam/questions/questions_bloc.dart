import 'package:collection/collection.dart';
import 'package:eduventure/data/network/response/type_option.dart';
import 'package:eduventure/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../../data/network/request/answers.dart';
import '../../../../../../../data/network/request/currect_answers_request.dart';
import '../../../../../../../data/network/request/question_result.dart';
import '../../../../../../../data/network/request/question_selection_result.dart';
import '../../../../../../../data/network/response/question.dart';
import '../../../../../../../data/network/response/question_result_response.dart';
import '../../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../../main.dart';

class QuestionsBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();
  final List<Question> questions;
  Set<QuestionSelection> selections = {};
  DateTime selectedDate = DateTime.now();
  final BehaviorSubject<int> selectedQuestionIndex = BehaviorSubject.seeded(0);

  QuestionsBloc(this.questions);

  QuestionSelection? getSelectedQuestion(int questionId) {
    return selections.firstWhereOrNull((element) => element.questionId == questionId);
  }

  Future<QuestionResultResponse> sendQuestionResult(int examId) async {
    final List<QuestionSelectionResult> answers = selections.map((selection) {
      return QuestionSelectionResult(
        id: selection.questionId,
        answer: selection.answerOption,
        time: selection.time,
        answerChangeCount: selection.answerChangeCount,
      );
    }).toList();

    final questions =
        this.questions.map((e) => CurrentAnswersRequest(id: e.id, correct: e.correct)).toList();

    return authRepository
        .sendQuestionResult(QuestionResult(examId: examId, answers: answers, questions: questions));
  }

  void onAnswer(int questionId, String answer, String answerOption) {
    final selection = selections.firstWhere(
      (element) => element.questionId == questionId,
      orElse: () => QuestionSelection(
        questionId: questionId,
        answer: answer,
        answerOption: answerOption,
      ),
    );

    selections.remove(selection);
    selections.add(selection.copyWith(
      answerChangeCount: selection.answerChangeCount + 1,
      answer: answer,
      answerOption: answerOption,
    ));
  }

  void onAnswerChanged({required int index, required bool isLast}) {
    final question = questions[index];
    final selection = selections.firstWhere(
      (element) => element.questionId == question.id,
      orElse: () => QuestionSelection(
        questionId: question.id,
      ),
    );

    final timeDiff = DateTime.now().difference(selectedDate).inSeconds;
    print("timeDiff ${timeDiff}");
    selections.remove(selection);
    selections.add(selection.copyWith(
      time: selection.time + timeDiff,
    ));

    selectedDate = DateTime.now();
    if (!isLast) {
      selectedQuestionIndex.add(index);
    }
  }
}
