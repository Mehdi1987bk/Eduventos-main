import 'package:eduventure/data/network/response/raiting_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'raiting_list.g.dart';

@JsonSerializable()
class RaitingList {
  final List<RaitingResponse> list;

  RaitingList({required this.list});

  factory RaitingList.fromJson(Map<String, dynamic> json) => _$RaitingListFromJson(json);

  Map<String, dynamic> toJson() => _$RaitingListToJson(this);
}
