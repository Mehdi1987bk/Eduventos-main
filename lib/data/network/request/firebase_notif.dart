import 'package:json_annotation/json_annotation.dart';
part 'firebase_notif.g.dart';
@JsonSerializable()
class FirebaseNotif {
  final int notificationType;
  final String token;
  final String deviceId;

  FirebaseNotif({required this.notificationType, required this.token, required this.deviceId});

factory FirebaseNotif.fromJson(Map<String, dynamic> json) => _$FirebaseNotifFromJson(json);

Map<String, dynamic> toJson() => _$FirebaseNotifToJson(this);
}
