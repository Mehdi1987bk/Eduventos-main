
import 'package:json_annotation/json_annotation.dart';

part 'menu_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MenuList {
  final int id;
  final int orderNumber;
  final String type;
  final String nameAz;
  final String slug;
  final int sidebarStatus;
  final int topbarStatus;
  final int status;
  final String createdAt;
  final String updatedAt;
  final String icon;

  MenuList({
    required this.id,
    required this.orderNumber,
    required this.type,
    required this.nameAz,
    required this.slug,
    required this.sidebarStatus,
    required this.topbarStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.icon,
  });

  factory MenuList.fromJson(Map<String, dynamic> json) => _$MenuListFromJson(json);

  Map<String, dynamic> toJson() => _$MenuListToJson(this);
}

