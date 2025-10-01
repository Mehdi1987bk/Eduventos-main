import 'instructions.dart';

import 'package:json_annotation/json_annotation.dart';

part 'instructions_data.g.dart';

@JsonSerializable()
class InstructionsData {
  // final List<Instructions> data;
  final Instructions data;

  InstructionsData({required this.data});

  factory InstructionsData.fromJson(Map<String, dynamic> json) =>
      _$InstructionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionsDataToJson(this);
}
