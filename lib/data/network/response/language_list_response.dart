import 'package:eduventure/data/network/response/type_option.dart';

import 'package:json_annotation/json_annotation.dart';

part 'language_list_response.g.dart';

@JsonSerializable()
class LanguageListResponse {
  final List<TypeOption> list;

  LanguageListResponse({required this.list});

  factory LanguageListResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageListResponseToJson(this);
}
