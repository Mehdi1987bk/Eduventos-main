import 'package:json_annotation/json_annotation.dart';

part 'subs_pay_request.g.dart';

@JsonSerializable()
class SubsPayRequest {
  final int studentId;
  final int packageId;

  SubsPayRequest({
    required this.studentId,
    required this.packageId,
  });

  factory SubsPayRequest.fromJson(Map<String, dynamic> json) =>
      _$SubsPayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubsPayRequestToJson(this);
}
