// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_notify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveNotifyRequest _$ApproveNotifyRequestFromJson(
        Map<String, dynamic> json) =>
    ApproveNotifyRequest(
      notificationId: json['notificationId'] as int,
      accept: json['accept'] as int,
    );

Map<String, dynamic> _$ApproveNotifyRequestToJson(
        ApproveNotifyRequest instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'accept': instance.accept,
    };
