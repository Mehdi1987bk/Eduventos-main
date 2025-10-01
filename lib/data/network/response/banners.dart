import 'package:json_annotation/json_annotation.dart';

part 'banners.g.dart';

@JsonSerializable()
class Banners {
  final int id;
  final String image;
  final String? link;

  Banners({required this.image, this.link, required this.id});

  factory Banners.fromJson(Map<String, dynamic> json) => _$BannersFromJson(json);

  Map<String, dynamic> toJson() => _$BannersToJson(this);
}