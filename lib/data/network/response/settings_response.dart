import 'package:eduventure/data/network/response/settings.dart';
import 'package:json_annotation/json_annotation.dart';
 part 'settings_response.g.dart';
@JsonSerializable()
class SettingsResponse{
  final Settings data;

  SettingsResponse(this.data);

  factory SettingsResponse.fromJson(Map<String, dynamic> json) => _$SettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsResponseToJson(this);
}