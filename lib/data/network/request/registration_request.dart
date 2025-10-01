import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'registration_request.g.dart';

@JsonSerializable( )
class RegistrationRequest {
  final String name;
  final String phoneNumber;
  final String password;
  final String surname;
  final String isParent;
  final String otpCode;


  RegistrationRequest({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.surname,
    required this.isParent,
    required this.otpCode,
  });

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);
}
