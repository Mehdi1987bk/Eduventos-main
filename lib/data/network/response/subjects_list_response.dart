import 'package:eduventure/data/network/response/type_option.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subjects_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SubjectsListResponse {
  final List<TypeOption> list;

  SubjectsListResponse({required this.list});

  factory SubjectsListResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsListResponseToJson(this);
}
