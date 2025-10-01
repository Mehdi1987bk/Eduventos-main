// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_pay_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubsPayStatus _$SubsPayStatusFromJson(Map<String, dynamic> json) =>
    SubsPayStatus(
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SubsPayStatusToJson(SubsPayStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
