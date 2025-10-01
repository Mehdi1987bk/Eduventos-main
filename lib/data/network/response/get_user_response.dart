import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'get_user_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetUserResponse {
  final User user;

  GetUserResponse({required this.user});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) => _$GetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);
}
