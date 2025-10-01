// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsRequest _$StatisticsRequestFromJson(Map<String, dynamic> json) =>
    StatisticsRequest(
      userId: json['userId'] as int,
      performanceFilter: json['performanceFilter'] as String?,
      countFilter: json['countFilter'] as String?,
      examFilter: json['examFilter'] as String?,
    );

Map<String, dynamic> _$StatisticsRequestToJson(StatisticsRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'performanceFilter': instance.performanceFilter,
      'countFilter': instance.countFilter,
      'examFilter': instance.examFilter,
    };
