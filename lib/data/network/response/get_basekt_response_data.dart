import 'package:json_annotation/json_annotation.dart';

import 'get_basekt_data.dart';

part 'get_basekt_response_data.g.dart';

@JsonSerializable()
class GetBasektResponseData{
  final List<GetBasektData> data;

  GetBasektResponseData({required this.data});

  factory GetBasektResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetBasektResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetBasektResponseDataToJson(this);
}