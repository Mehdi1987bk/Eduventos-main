import 'package:json_annotation/json_annotation.dart';

part 'forgot_password.g.dart';

@JsonSerializable()
class ForgotPassword {
  final String phoneNumber;
  final String otpCode;

  ForgotPassword({required this.phoneNumber, required this.otpCode});

  factory ForgotPassword.fromJson(Map<String, dynamic> json) => _$ForgotPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordToJson(this);
}
