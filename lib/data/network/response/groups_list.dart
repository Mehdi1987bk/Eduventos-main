import 'package:eduventure/data/network/response/type_option.dart';

import 'package:json_annotation/json_annotation.dart';

part 'groups_list.g.dart';

@JsonSerializable()
class GroupsList {
  final List<TypeOption> list;

  GroupsList({required this.list});

  factory GroupsList.fromJson(Map<String, dynamic> json) => _$GroupsListFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsListToJson(this);
}
