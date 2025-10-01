// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_initiate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsInitiateRequest _$PaymentsInitiateRequestFromJson(
        Map<String, dynamic> json) =>
    PaymentsInitiateRequest(
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      userId: json['userId'] as int,
      packageId: json['packageId'] as int,
    );

Map<String, dynamic> _$PaymentsInitiateRequestToJson(
        PaymentsInitiateRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
      'userId': instance.userId,
      'packageId': instance.packageId,
    };
