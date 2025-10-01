import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../../../../data/network/request/exam.dart';
import '../../../../../../data/network/request/exam_id_reqister.dart';
import '../../../../../../data/network/request/exam_reqister.dart';
import '../../../../../../data/network/response/question.dart';
import '../../../../../../data/network/response/user.dart';
import '../../../../../../domain/entities/pagination.dart';
import '../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../main.dart';
import '../../../../../../presentation/bloc/paginable_bloc.dart';

class ExamBloc extends PaginableBloc<Exam> {
  final authRepository = sl.get<AuthRepository>();
  final Stream onReflash;
  final int? subjectId;
  final int? classId;
  final String? type;
  final String? part;
  final int? isGroup;

  ExamBloc({
    required this.onReflash,
    this.subjectId,
    this.classId,
    this.type,
    this.part,
    this.isGroup,
  });

  final BehaviorSubject<String> _search = BehaviorSubject.seeded("");
  late StreamSubscription _searchSubscription;

  @override
  void init() {
    super.init();
    onReflash.listen((event) {
      load(refresh: true);
    });
    _searchSubscription =
        _search.debounceTime(const Duration(milliseconds: 350)).listen((_) => load(refresh: true));
  }

  Future<List<Question>> questions(int examId) =>
      authRepository.questions(ExamIdReqister(examId: examId));

  late final Stream<User> userDetails =
      ValueConnectableStream(authRepository.userDetails).autoConnect();

  Future<void> loadList() async {
    load(refresh: true);
  }

  @override
  Future<Pagination<Exam>> provideSource(int page) async {
    return run(
      authRepository.exam(
        page,
        ExamReqister(
          subjectId: subjectId ?? 0,
          classId: classId ?? 0,
          type: type ?? 'test',
          part: part,
          isGroup: isGroup,
          searchKey: _search.value,
        ),
      ),
    );
  }

  void onSearch(String text) {
    _search.add(text);
  }

  @override
  void dispose() {
    _searchSubscription.cancel();
    super.dispose();
  }
}
