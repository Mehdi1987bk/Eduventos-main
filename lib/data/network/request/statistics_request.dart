import 'package:json_annotation/json_annotation.dart';

part 'statistics_request.g.dart';

@JsonSerializable()
class StatisticsRequest {
  final int userId;
  final String? performanceFilter;
  final String? countFilter;
  final String? examFilter;

  StatisticsRequest({
    required this.userId,
    required this.performanceFilter,
    required this.countFilter,
    required this.examFilter,
  });

  factory StatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$StatisticsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsRequestToJson(this);
}
