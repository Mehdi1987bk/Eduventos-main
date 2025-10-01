import 'order_details.dart';

import 'package:json_annotation/json_annotation.dart';

part 'order_details_data.g.dart';

@JsonSerializable()
class OrderDetailsData{
  final List<OrderDetails> data;

  OrderDetailsData(this.data);

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) => _$OrderDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsDataToJson(this);



}