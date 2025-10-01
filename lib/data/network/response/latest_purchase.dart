import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'latest_purchase.g.dart';

@HiveType(typeId: 26)
@JsonSerializable(fieldRename: FieldRename.snake)
class LatestPurchase extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? studentId;
  @HiveField(2)
  final int? packageId;
  @HiveField(3)
  final String? type;
  @HiveField(4)
  final int? payment;
  @HiveField(5)
  final String? price;

  LatestPurchase(this.id, this.studentId, this.packageId, this.type, this.payment, this.price);

  factory LatestPurchase.fromJson(Map<String, dynamic> json) => _$LatestPurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$LatestPurchaseToJson(this);
}
