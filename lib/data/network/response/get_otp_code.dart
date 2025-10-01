import 'package:json_annotation/json_annotation.dart';

part 'get_otp_code.g.dart';

@JsonSerializable()
class GetOtpCode {
  final int otp;

  GetOtpCode({required this.otp});

  factory GetOtpCode.fromJson(Map<String, dynamic> json) => _$GetOtpCodeFromJson(json);

  Map<String, dynamic> toJson() => _$GetOtpCodeToJson(this);
}
