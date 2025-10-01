import 'package:json_annotation/json_annotation.dart';

part 'update_user_data_request.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserDataRequest {
  final String name;
  final String surname;
  final String password;
  final String isParent;
  final String? fatherName;
  final String? langId;
  final String? regionId;
  final String? studentClassId;
  final String? groupId;

  UpdateUserDataRequest({
    required this.name,
    required this.surname,
    required this.password,
    required this.isParent,
    this.fatherName,
    this.langId,
    this.regionId,
    this.studentClassId,
    this.groupId,
  });

  factory UpdateUserDataRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDataRequestToJson(this);
}
