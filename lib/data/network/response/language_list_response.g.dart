// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageListResponse _$LanguageListResponseFromJson(
        Map<String, dynamic> json) =>
    LanguageListResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => TypeOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageListResponseToJson(
        LanguageListResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
