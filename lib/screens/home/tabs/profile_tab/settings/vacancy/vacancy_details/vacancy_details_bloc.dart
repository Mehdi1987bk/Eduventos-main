import 'dart:io';

import '../../../../../../../domain/repositories/auth_repository.dart';
import '../../../../../../../main.dart';
import '../../../../../../../presentation/bloc/base_bloc.dart';

class VacancyDetailsBloc extends BaseBloc {
  final authRepository = sl.get<AuthRepository>();

  String? fileName;
  String? motionName;
  String dialCode = '55';
  File? cvFile;
  File? motifFile;

  Future<void> vacancyApply({
    required String? vacancyId,
    required String? email,
    required String? surname,
    required String? phone,
    required String? text,
  }) async {
    await run(authRepository.vacancyApply(
      email: email,
      surname: surname,
      phone: phone,
      text: text,
      cv: cvFile,
      motif: motifFile,
      vacancyId: vacancyId,
    ));
  }
}
