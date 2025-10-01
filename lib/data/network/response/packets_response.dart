import 'package:json_annotation/json_annotation.dart';

part 'packets_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PacketsResponse {
  final int id;
  final int month;
  final String price;
  final String discountedPrice;
  final String titleAz;
  final String contentAz;

  PacketsResponse(
      this.id, this.month, this.price, this.discountedPrice, this.titleAz, this.contentAz);

  factory PacketsResponse.fromJson(Map<String, dynamic> json) => _$PacketsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PacketsResponseToJson(this);
}
