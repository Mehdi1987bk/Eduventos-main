import 'package:eduventure/data/network/response/packets_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'packets_response_list.g.dart';

@JsonSerializable()
class PacketsResponseList {
  final List<PacketsResponse> list;

  PacketsResponseList({required this.list});

  factory PacketsResponseList.fromJson(Map<String, dynamic> json) =>
      _$PacketsResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$PacketsResponseListToJson(this);
}
