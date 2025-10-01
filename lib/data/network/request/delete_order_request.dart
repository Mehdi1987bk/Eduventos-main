
import 'package:json_annotation/json_annotation.dart';

part 'delete_order_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DeleteOrderRequest{
  final int cartId;

  DeleteOrderRequest({required this.cartId});

  factory DeleteOrderRequest.fromJson(Map<String, dynamic> json) => _$DeleteOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteOrderRequestToJson(this);
}