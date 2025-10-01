import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Settings {
  final String? instagram;
  final String? facebook;
  final String? linkedin;
  final String? email;
  final String? phone;
  final String? titleAz;
  final String? keywordsAz;
  final String? descriptionAz;
  final String? vacancyAz;
  final int? video;

  Settings(
    this.instagram,
    this.facebook,
    this.linkedin,
    this.email,
    this.phone,
    this.titleAz,
    this.keywordsAz,
    this.descriptionAz,
    this.vacancyAz,
    this.video,
  );

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
