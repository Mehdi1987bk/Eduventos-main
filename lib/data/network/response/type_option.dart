import 'package:eduventure/data/network/response/subject.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_option.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 18)
class TypeOption extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int? count;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? titleAz;
  @HiveField(5)
  final double? price;
  @HiveField(6)
  final String? imageUrl;
  @HiveField(7)
  final List<String>? images;
  @HiveField(8)
  final List<Subject>? subjects;
  @HiveField(9)
  final bool? boolParams;


  TypeOption({
    required this.id,
    required this.name,
    this.count,
    this.title,
    this.titleAz,
    this.price,
    this.subjects,
    this.imageUrl,
    this.images,
    this.boolParams,
  });

  factory TypeOption.fromJson(Map<String, dynamic> json) => _$TypeOptionFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOptionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is TypeOption && other.id == id);

  @override
  int get hashCode => id.hashCode;


}
