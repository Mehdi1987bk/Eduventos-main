// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      json['instagram'] as String?,
      json['facebook'] as String?,
      json['linkedin'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['title_az'] as String?,
      json['keywords_az'] as String?,
      json['description_az'] as String?,
      json['vacancy_az'] as String?,
      json['video'] as int?,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'email': instance.email,
      'phone': instance.phone,
      'title_az': instance.titleAz,
      'keywords_az': instance.keywordsAz,
      'description_az': instance.descriptionAz,
      'vacancy_az': instance.vacancyAz,
      'video': instance.video,
    };
