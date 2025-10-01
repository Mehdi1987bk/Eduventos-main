
import 'package:eduventure/data/network/response/video_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_result_response.g.dart';

@JsonSerializable()
class VideoResultResponse{
  final List<VideoResponse> results;

  VideoResultResponse({required this.results});

  factory VideoResultResponse.fromJson(Map<String, dynamic> json) => _$VideoResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResultResponseToJson(this);
}