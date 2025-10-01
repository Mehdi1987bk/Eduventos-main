import 'package:eduventure/data/network/response/purchase.dart';

import 'package:json_annotation/json_annotation.dart';

part 'purchases_response.g.dart';

@JsonSerializable()
class PurchasesResponse{
  final List<Purchase> list;

  PurchasesResponse({required this.list});

  factory PurchasesResponse.fromJson(Map<String, dynamic> json) => _$PurchasesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchasesResponseToJson(this);
}