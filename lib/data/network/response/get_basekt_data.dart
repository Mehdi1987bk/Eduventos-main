import 'package:eduventure/data/network/response/type_option.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_basekt_data.g.dart';

@JsonSerializable()

class GetBasektData {
  final int id;
  final int count;
  final TypeOption customer;
  final TypeOption product;

  GetBasektData({
    required this.id,
    required this.count,
    required this.customer,
    required this.product,
  });

  factory GetBasektData.fromJson(Map<String, dynamic> json) =>
      _$GetBasektDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetBasektDataToJson(this);
}
