import 'package:json_annotation/json_annotation.dart';

part 'instructions.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Instructions {
  final int? id;
  final String? titleAz;
  final String? video;
  final int? status;
  final String? type;

  Instructions({
    this.id,
    this.titleAz,
    this.video,
    this.status,
    this.type,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => _$InstructionsFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionsToJson(this);
}
