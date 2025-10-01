import 'package:json_annotation/json_annotation.dart';

part 'get_notifications.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetNotifications {
  final int id;
  final int studentId;
  final int? studentParentId;
  final int? addedParentId;
  final String? image;
  final String? title;
  final String? text;
  final int? readStatus;
  final String? type;
  final DateTime createdAt;

  GetNotifications(this.id, this.studentId, this.studentParentId, this.addedParentId, this.image,
      this.title, this.text, this.readStatus, this.type, this.createdAt);

  factory GetNotifications.fromJson(Map<String, dynamic> json) => _$GetNotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationsToJson(this);
}
