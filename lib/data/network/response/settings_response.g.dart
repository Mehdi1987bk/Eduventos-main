// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsResponse _$SettingsResponseFromJson(Map<String, dynamic> json) =>
    SettingsResponse(
      Settings.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsResponseToJson(SettingsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
