import 'package:json_annotation/json_annotation.dart';

part 'send_otp_reqister.g.dart';

@JsonSerializable()
class SendOtpReqister {
  final String phoneNumber;
  final int isParent;

  SendOtpReqister({required this.phoneNumber, required this.isParent});

  factory SendOtpReqister.fromJson(Map<String, dynamic> json) => _$SendOtpReqisterFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpReqisterToJson(this);
}
