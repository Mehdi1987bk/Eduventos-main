// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubsPayRequest _$SubsPayRequestFromJson(Map<String, dynamic> json) =>
    SubsPayRequest(
      studentId: json['studentId'] as int,
      packageId: json['packageId'] as int,
    );

Map<String, dynamic> _$SubsPayRequestToJson(SubsPayRequest instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'packageId': instance.packageId,
    };
