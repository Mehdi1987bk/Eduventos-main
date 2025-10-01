
import 'package:json_annotation/json_annotation.dart';

part 'send_order_request.g.dart';

@JsonSerializable()
class SendOrderRequest {
  final double price;
  final String note;
  final List<Map<String, dynamic>> products;

  SendOrderRequest({required this.price, required this.note, required this.products});

  factory SendOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendOrderRequestToJson(this);
}
