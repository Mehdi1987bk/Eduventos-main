// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_posts_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsResponseList _$GetPostsResponseListFromJson(
        Map<String, dynamic> json) =>
    GetPostsResponseList(
      (json['list'] as List<dynamic>)
          .map((e) => GetPostsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPostsResponseListToJson(
        GetPostsResponseList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
