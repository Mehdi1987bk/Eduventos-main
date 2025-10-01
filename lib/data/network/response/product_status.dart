
import 'package:json_annotation/json_annotation.dart';

part 'product_status.g.dart';

@JsonSerializable()
class ProductStatus{
  final int status;
  final String name;

  ProductStatus(this.status, this.name);
  factory ProductStatus.fromJson(Map<String, dynamic> json) => _$ProductStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStatusToJson(this);
}