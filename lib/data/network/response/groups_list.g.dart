// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsList _$GroupsListFromJson(Map<String, dynamic> json) => GroupsList(
      list: (json['list'] as List<dynamic>)
          .map((e) => TypeOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupsListToJson(GroupsList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
