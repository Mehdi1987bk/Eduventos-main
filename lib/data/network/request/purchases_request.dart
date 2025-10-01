
import 'package:json_annotation/json_annotation.dart';

part 'purchases_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PurchasesRequest{
  final int userId;

  PurchasesRequest({required this.userId});

  factory PurchasesRequest.fromJson(Map<String, dynamic> json) => _$PurchasesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PurchasesRequestToJson(this);
}