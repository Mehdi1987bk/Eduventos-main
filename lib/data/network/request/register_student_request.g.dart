// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_student_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationStudentRequest _$RegistrationStudentRequestFromJson(
        Map<String, dynamic> json) =>
    RegistrationStudentRequest(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      surname: json['surname'] as String,
      isParent: json['isParent'] as String,
      otpCode: json['otpCode'] as String,
      fatherName: json['fatherName'] as String,
      langId: json['langId'] as String,
      sectorId: json['sectorId'] as String,
      studentClassId: json['studentClassId'] as String,
      regionId: json['regionId'] as String,
      groupId: json['groupId'] as int,
      promoCode: json['promoCode'] as String?,
    );

Map<String, dynamic> _$RegistrationStudentRequestToJson(
        RegistrationStudentRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'surname': instance.surname,
      'fatherName': instance.fatherName,
      'langId': instance.langId,
      'sectorId': instance.sectorId,
      'studentClassId': instance.studentClassId,
      'regionId': instance.regionId,
      'isParent': instance.isParent,
      'otpCode': instance.otpCode,
      'groupId': instance.groupId,
      'promoCode': instance.promoCode,
    };
