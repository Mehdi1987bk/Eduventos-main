import 'package:json_annotation/json_annotation.dart';

part 'purchase.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Purchase {
  final String type;
  final String? price;
  final DateTime createdAt;

  Purchase(this.type, this.price, this.createdAt);

  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
