// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_reqister.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpReqister _$SendOtpReqisterFromJson(Map<String, dynamic> json) =>
    SendOtpReqister(
      phoneNumber: json['phoneNumber'] as String,
      isParent: json['isParent'] as int,
    );

Map<String, dynamic> _$SendOtpReqisterToJson(SendOtpReqister instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'isParent': instance.isParent,
    };
