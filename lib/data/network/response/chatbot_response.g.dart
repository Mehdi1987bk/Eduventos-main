// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatbotResponse _$ChatbotResponseFromJson(Map<String, dynamic> json) =>
    ChatbotResponse(
      text: json['text'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedChoiceLabel: json['selectedChoiceLabel'] as String?,
    );

Map<String, dynamic> _$ChatbotResponseToJson(ChatbotResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'choices': instance.choices,
      'selectedChoiceLabel': instance.selectedChoiceLabel,
    };
