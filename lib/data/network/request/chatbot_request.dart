import 'package:json_annotation/json_annotation.dart';

part 'chatbot_request.g.dart';

@JsonSerializable()
class ChatbotRequest {
  final String message;

  ChatbotRequest({required this.message});

  factory ChatbotRequest.fromJson(Map<String, dynamic> json) => _$ChatbotRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotRequestToJson(this);
}
