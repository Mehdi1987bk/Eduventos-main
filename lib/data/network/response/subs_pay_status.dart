import 'package:json_annotation/json_annotation.dart';

part 'subs_pay_status.g.dart';

@JsonSerializable()
class SubsPayStatus {
  final String status;
  final String? message;

  SubsPayStatus({
    required this.status,
     this.message,
  });

  factory SubsPayStatus.fromJson(Map<String, dynamic> json) => _$SubsPayStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SubsPayStatusToJson(this);
}
