// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuListResponse _$MenuListResponseFromJson(Map<String, dynamic> json) =>
    MenuListResponse(
      (json['list'] as List<dynamic>)
          .map((e) => MenuList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuListResponseToJson(MenuListResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
