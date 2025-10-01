import 'package:json_annotation/json_annotation.dart';

part 'payments_initiate_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentsInitiateResponse {
  final String redirectUrl;

  PaymentsInitiateResponse(this.redirectUrl);

  factory PaymentsInitiateResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentsInitiateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsInitiateResponseToJson(this);
}
