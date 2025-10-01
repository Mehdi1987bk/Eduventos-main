// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as int,
      fields[1] as String,
      fields[12] as String?,
      fields[2] as String,
      fields[3] as String?,
      fields[4] as String,
      fields[5] as String?,
      fields[6] as double?,
      fields[7] as double?,
      fields[8] as double?,
      fields[9] as double?,
      fields[10] as TypeOption?,
      (fields[11] as List?)?.cast<User>(),
      fields[13] as String?,
      fields[14] as int?,
      fields[15] as int?,
      fields[16] as int?,
      fields[17] as int?,
      fields[18] as int?,
      fields[19] as LatestPurchase?,
      fields[20] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.isParent)
      ..writeByte(7)
      ..write(obj.totalVent)
      ..writeByte(8)
      ..write(obj.highestVent)
      ..writeByte(9)
      ..write(obj.lastVent)
      ..writeByte(10)
      ..write(obj.studentClass)
      ..writeByte(11)
      ..write(obj.children)
      ..writeByte(12)
      ..write(obj.balance)
      ..writeByte(13)
      ..write(obj.father)
      ..writeByte(14)
      ..write(obj.langId)
      ..writeByte(15)
      ..write(obj.regionId)
      ..writeByte(16)
      ..write(obj.studentClassId)
      ..writeByte(17)
      ..write(obj.groupId)
      ..writeByte(18)
      ..write(obj.subsTime)
      ..writeByte(19)
      ..write(obj.latestPurchase)
      ..writeByte(20)
      ..write(obj.packageName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['code'] as String,
      json['balance'] as String? ?? '0',
      json['surname'] as String,
      json['name'] as String?,
      json['phone'] as String,
      json['image'] as String?,
      (json['isParent'] as num?)?.toDouble(),
      (json['total_vent'] as num?)?.toDouble(),
      (json['highest_vent'] as num?)?.toDouble(),
      (json['last_vent'] as num?)?.toDouble(),
      json['student_class'] == null
          ? null
          : TypeOption.fromJson(json['student_class'] as Map<String, dynamic>),
      (json['children'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['father'] as String?,
      json['lang_id'] as int?,
      json['region_id'] as int?,
      json['student_class_id'] as int?,
      json['group_id'] as int?,
      json['subsTime'] as int?,
      json['latest_purchase'] == null
          ? null
          : LatestPurchase.fromJson(
              json['latest_purchase'] as Map<String, dynamic>),
      json['packageName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'surname': instance.surname,
      'name': instance.name,
      'phone': instance.phone,
      'image': instance.image,
      'isParent': instance.isParent,
      'total_vent': instance.totalVent,
      'highest_vent': instance.highestVent,
      'last_vent': instance.lastVent,
      'student_class': instance.studentClass,
      'children': instance.children,
      'balance': instance.balance,
      'father': instance.father,
      'lang_id': instance.langId,
      'region_id': instance.regionId,
      'student_class_id': instance.studentClassId,
      'group_id': instance.groupId,
      'subsTime': instance.subsTime,
      'latest_purchase': instance.latestPurchase,
      'packageName': instance.packageName,
    };
