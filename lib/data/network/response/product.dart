
import 'package:eduventure/data/network/response/product_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  final int? count;
  final int? productId;
  final String name;
  final double? price;
  final List<String> images;
  final ProductCategory? category;


  Product({
    required this.count,
    required this.name,
    required this.productId,
    required this.price,
    required this.images,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
