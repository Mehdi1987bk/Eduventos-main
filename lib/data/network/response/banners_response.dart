import 'package:json_annotation/json_annotation.dart';
import 'banners.dart';

part 'banners_response.g.dart';
@JsonSerializable(explicitToJson: true)
class BannersResponse{
  final List<Banners> list;

  BannersResponse({required this.list});

factory BannersResponse.fromJson(Map<String, dynamic> json) => _$BannersResponseFromJson(json);

Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}