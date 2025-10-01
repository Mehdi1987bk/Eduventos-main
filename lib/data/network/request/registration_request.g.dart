// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequest _$RegistrationRequestFromJson(Map<String, dynamic> json) =>
    RegistrationRequest(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      surname: json['surname'] as String,
      isParent: json['isParent'] as String,
      otpCode: json['otpCode'] as String,
    );

Map<String, dynamic> _$RegistrationRequestToJson(
        RegistrationRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'surname': instance.surname,
      'isParent': instance.isParent,
      'otpCode': instance.otpCode,
    };
