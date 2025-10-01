// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDataRequest _$UpdateUserDataRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserDataRequest(
      name: json['name'] as String,
      surname: json['surname'] as String,
      password: json['password'] as String,
      isParent: json['isParent'] as String,
      fatherName: json['fatherName'] as String?,
      langId: json['langId'] as String?,
      regionId: json['regionId'] as String?,
      studentClassId: json['studentClassId'] as String?,
      groupId: json['groupId'] as String?,
    );

Map<String, dynamic> _$UpdateUserDataRequestToJson(
    UpdateUserDataRequest instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'surname': instance.surname,
    'password': instance.password,
    'isParent': instance.isParent,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fatherName', instance.fatherName);
  writeNotNull('langId', instance.langId);
  writeNotNull('regionId', instance.regionId);
  writeNotNull('studentClassId', instance.studentClassId);
  writeNotNull('groupId', instance.groupId);
  return val;
}
