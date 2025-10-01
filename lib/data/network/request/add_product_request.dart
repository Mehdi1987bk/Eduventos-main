import 'package:json_annotation/json_annotation.dart';

part 'add_product_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddProductRequest {
  final int productId;
  final int count;

  AddProductRequest({required this.productId, required this.count});

  factory AddProductRequest.fromJson(Map<String, dynamic> json) =>
      _$AddProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductRequestToJson(this);
}
