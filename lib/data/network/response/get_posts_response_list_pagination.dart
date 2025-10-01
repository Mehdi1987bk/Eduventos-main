import 'package:eduventure/domain/entities/pagination.dart';

import 'get_posts_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'get_posts_response_list_pagination.g.dart';

@JsonSerializable()
class GetPostsResponseListPagination {
  final Pagination<GetPostsResponse> list;

  GetPostsResponseListPagination(this.list);

  factory GetPostsResponseListPagination.fromJson(Map<String, dynamic> json) =>
      _$GetPostsResponseListPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostsResponseListPaginationToJson(this);
}
