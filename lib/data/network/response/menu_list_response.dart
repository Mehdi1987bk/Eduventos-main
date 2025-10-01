import 'menu_list.dart';

import 'package:json_annotation/json_annotation.dart';

part 'menu_list_response.g.dart';

@JsonSerializable()
class MenuListResponse{
 final List<MenuList> list;

  MenuListResponse(this.list);

  factory MenuListResponse.fromJson(Map<String, dynamic> json) => _$MenuListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuListResponseToJson(this);
}