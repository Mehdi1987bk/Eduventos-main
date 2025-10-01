import 'choices.dart';

import 'package:json_annotation/json_annotation.dart';

part 'chatbot_response.g.dart';
@JsonSerializable()
class ChatbotResponse {
  final String text;
  final List<Choices> choices;
  final String? selectedChoiceLabel;

  ChatbotResponse({
    required this.text,
    required this.choices,
    this.selectedChoiceLabel,
  });

  ChatbotResponse copyWith({String? selectedChoiceLabel}) {
    return ChatbotResponse(
      text: text,
      choices: choices,
      selectedChoiceLabel: selectedChoiceLabel ?? this.selectedChoiceLabel,
    );
  }

  factory ChatbotResponse.fromJson(Map<String, dynamic> json) => _$ChatbotResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatbotResponseToJson(this);
}
