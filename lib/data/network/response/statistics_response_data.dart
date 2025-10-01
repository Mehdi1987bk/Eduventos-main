
import 'package:eduventure/data/network/response/statistics_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statistics_response_data.g.dart';

@JsonSerializable()
class StatisticsResponseData{
  final StatisticsResponse data;

  StatisticsResponseData({required this.data});

  factory StatisticsResponseData.fromJson(Map<String, dynamic> json) => _$StatisticsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsResponseDataToJson(this);
}