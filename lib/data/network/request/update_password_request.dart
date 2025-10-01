import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdatePasswordRequest {
  final String password;
  final String passwordConfirmation;

  UpdatePasswordRequest({required this.password, required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);
}
