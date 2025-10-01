import 'dart:convert';
import 'dart:io';

import 'package:rxdart/rxdart.dart';

import '../../../data/network/request/register_student_request.dart';
import '../../../data/network/request/registration_request.dart';
import '../../../data/network/response/get_otp_code.dart';
import '../../../data/network/response/groups_list.dart';
import '../../../data/network/response/send_otp_reqister.dart';
import '../../../data/network/response/type_option.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../main.dart';
import '../../../presentation/bloc/base_bloc.dart';

class RegistrationStudentBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  final PublishSubject<File> userAvatar = PublishSubject();
  String dialCode = '55';

  late String code;

  Future<GetOtpCode> sendOtpRegister(SendOtpReqister request) {
    return run(_authRepository.sendOtpRegister(request));
  }

  late final Future<List<TypeOption>> getLanguages = _authRepository.getLanguages();

  late final Future<List<TypeOption>> getClasses = _authRepository.getClasses();

  late final Future<List<TypeOption>> getRegions = _authRepository.getRegions();

  late final Future<GroupsList> getGroups = _authRepository.getGroups();

  Future<void> registration({
    required String isParent,
    required String name,
    required String password,
    required String phone,
    required String sername,
    required String fatherName,
    required String otpCode,
    required TypeOption language,
    required TypeOption clas,
    required TypeOption regions,
    required TypeOption groupId,
    final String? promoCode,
  }) {
    if (isParent == "1") {
      return run(_authRepository.checkOtpAddStudent(
        RegistrationStudentRequest(
          name: name,
          phoneNumber: phone,
          password: password,
          surname: sername,
          isParent: isParent,
          otpCode: otpCode,
          fatherName: fatherName,
          langId: language?.id.toString() ?? "",
          sectorId: "1",
          studentClassId: clas?.id.toString() ?? "",
          regionId: regions?.id.toString() ?? "",
          groupId: groupId.id,
          promoCode: promoCode,
        ),
      ));
    } else {
      return run(_authRepository.checkOtpRStudentegister(
        RegistrationStudentRequest(
          name: name,
          phoneNumber: phone,
          password: password,
          surname: sername,
          isParent: isParent,
          otpCode: otpCode,
          fatherName: fatherName,
          langId: language?.id.toString() ?? "",
          sectorId: "1",
          studentClassId: clas?.id.toString() ?? "",
          regionId: regions?.id.toString() ?? "",
          groupId: groupId.id,
          promoCode: promoCode,
        ),
      ));
    }
  }
}
