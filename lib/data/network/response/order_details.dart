
import 'package:eduventure/data/network/response/product.dart';
import 'package:eduventure/data/network/response/product_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails{
  final int id;
  final double price;
  final String? note;
  final List<Product> products;
  final ProductStatus status;

  OrderDetails(this.id, this.price, this.note, this.products, this.status);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);

}