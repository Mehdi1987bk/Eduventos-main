// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationsPagination _$GetNotificationsPaginationFromJson(
        Map<String, dynamic> json) =>
    GetNotificationsPagination(
      Pagination<GetNotifications>.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetNotificationsPaginationToJson(
        GetNotificationsPagination instance) =>
    <String, dynamic>{
      'notification': instance.notification,
    };
