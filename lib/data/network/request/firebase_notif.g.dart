// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_notif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseNotif _$FirebaseNotifFromJson(Map<String, dynamic> json) =>
    FirebaseNotif(
      notificationType: json['notificationType'] as int,
      token: json['token'] as String,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$FirebaseNotifToJson(FirebaseNotif instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'token': instance.token,
      'deviceId': instance.deviceId,
    };
