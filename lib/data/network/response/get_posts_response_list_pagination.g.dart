// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_posts_response_list_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsResponseListPagination _$GetPostsResponseListPaginationFromJson(
        Map<String, dynamic> json) =>
    GetPostsResponseListPagination(
      Pagination<GetPostsResponse>.fromJson(
          json['list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPostsResponseListPaginationToJson(
        GetPostsResponseListPagination instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
