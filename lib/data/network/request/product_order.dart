import 'package:json_annotation/json_annotation.dart';

part 'product_order.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductOrder {
  final int productId;
  final int count;

  ProductOrder(this.productId, this.count);

  factory ProductOrder.fromJson(Map<String, dynamic> json) => _$ProductOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrderToJson(this);
}
