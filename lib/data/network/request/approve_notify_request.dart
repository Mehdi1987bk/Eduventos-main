import 'package:json_annotation/json_annotation.dart';

part 'approve_notify_request.g.dart';

@JsonSerializable()
class ApproveNotifyRequest {
  final int notificationId;
  final int accept;

  ApproveNotifyRequest({required this.notificationId, required this.accept});

  factory ApproveNotifyRequest.fromJson(Map<String, dynamic> json) =>
      _$ApproveNotifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApproveNotifyRequestToJson(this);
}
