
import 'package:json_annotation/json_annotation.dart';

part 'ai_generate_response.g.dart';

@JsonSerializable()

class AiGenerateResponse{
  final String description;

  AiGenerateResponse({required this.description});

  factory AiGenerateResponse.fromJson(Map<String, dynamic> json) => _$AiGenerateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AiGenerateResponseToJson(this);
}