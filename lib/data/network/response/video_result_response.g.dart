// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResultResponse _$VideoResultResponseFromJson(Map<String, dynamic> json) =>
    VideoResultResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => VideoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResultResponseToJson(
        VideoResultResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
