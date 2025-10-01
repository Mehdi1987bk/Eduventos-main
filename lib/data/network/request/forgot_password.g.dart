// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPassword _$ForgotPasswordFromJson(Map<String, dynamic> json) =>
    ForgotPassword(
      phoneNumber: json['phoneNumber'] as String,
      otpCode: json['otpCode'] as String,
    );

Map<String, dynamic> _$ForgotPasswordToJson(ForgotPassword instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otpCode': instance.otpCode,
    };
