import 'package:eduventure/data/network/request/exam.dart';
import 'package:json_annotation/json_annotation.dart';

part 'choices.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Choices {
  final String label;
  final String value;
  final Exam? exam;
  final bool? clickable;

  Choices({
    required this.label,
    required this.value,
    required this.exam,
    this.clickable,
  });

  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);

  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}
