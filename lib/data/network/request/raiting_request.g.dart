// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raiting_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaitingRequest _$RaitingRequestFromJson(Map<String, dynamic> json) =>
    RaitingRequest(
      examId: json['examId'] as int?,
      regionId: json['regionId'] as int?,
      classId: json['classId'] as int?,
    );

Map<String, dynamic> _$RaitingRequestToJson(RaitingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('examId', instance.examId);
  writeNotNull('regionId', instance.regionId);
  writeNotNull('classId', instance.classId);
  return val;
}
