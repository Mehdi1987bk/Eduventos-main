import 'package:eduventure/domain/entities/pagination.dart';

import 'get_notifications.dart';
import 'get_posts_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'get_notifications_pagination.g.dart';

@JsonSerializable()
class GetNotificationsPagination {
  final Pagination<GetNotifications> notification;

  GetNotificationsPagination(this.notification);

  factory GetNotificationsPagination.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationsPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationsPaginationToJson(this);
}
