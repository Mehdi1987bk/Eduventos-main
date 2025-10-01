import 'package:json_annotation/json_annotation.dart';

part 'payments_initiate_request.g.dart';

@JsonSerializable()
class PaymentsInitiateRequest {
  final double amount;
  final String type;
  final int userId;
  final int packageId;

  PaymentsInitiateRequest({
    required this.amount,
    required this.type,
    required this.userId,
    required this.packageId,
  });

  factory PaymentsInitiateRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentsInitiateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsInitiateRequestToJson(this);
}
