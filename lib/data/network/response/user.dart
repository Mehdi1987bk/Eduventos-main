import 'package:eduventure/data/network/response/type_option.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'latest_purchase.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String surname;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  @JsonKey(name: "isParent")
  final double? isParent;
  @HiveField(7)
  final double? totalVent;
  @HiveField(8)
  final double? highestVent;
  @HiveField(9)
  final double? lastVent;
  @HiveField(10)
  final TypeOption? studentClass;
  @HiveField(11)
  final List<User>? children;
  @HiveField(12)
  @JsonKey(defaultValue: "0")
  final String? balance;
  @HiveField(13)
  final String? father;
  @HiveField(14)
  final int? langId;
  @HiveField(15)
  final int? regionId;
  @HiveField(16)
  final int? studentClassId;
  @HiveField(17)
  final int? groupId;
  @HiveField(18)
  @JsonKey(name: "subsTime")
  final int? subsTime;
  @HiveField(19)
  @JsonKey(name: "latest_purchase")
  final LatestPurchase? latestPurchase;
  @HiveField(20)
  @JsonKey(name: "packageName")
  final String? packageName;

  User(
    this.id,
    this.code,
    this.balance,
    this.surname,
    this.name,
    this.phone,
    this.image,
    this.isParent,
    this.totalVent,
    this.highestVent,
    this.lastVent,
    this.studentClass,
    this.children,
    this.father,
    this.langId,
    this.regionId,
    this.studentClassId,
    this.groupId,
    this.subsTime,
    this.latestPurchase,
    this.packageName,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
