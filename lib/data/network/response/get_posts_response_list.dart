import 'get_posts_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'get_posts_response_list.g.dart';

@JsonSerializable()
class GetPostsResponseList{
  final List<GetPostsResponse> list;

  GetPostsResponseList(this.list);

  factory GetPostsResponseList.fromJson(Map<String, dynamic> json) => _$GetPostsResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostsResponseListToJson(this);
}