import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'register_student_request.g.dart';

@JsonSerializable()
class RegistrationStudentRequest {
  final String name;
  final String phoneNumber;
  final String password;
  final String surname;
  final String fatherName;
  final String langId;
  final String sectorId;
  final String studentClassId;
  final String regionId;
  final String isParent;
  final String otpCode;
  final int groupId;
  final String? promoCode;

  RegistrationStudentRequest({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.surname,
    required this.isParent,
    required this.otpCode,
    required this.fatherName,
    required this.langId,
    required this.sectorId,
    required this.studentClassId,
    required this.regionId,
    required this.groupId,
    this.promoCode,
  });

  factory RegistrationStudentRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationStudentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationStudentRequestToJson(this);
}
