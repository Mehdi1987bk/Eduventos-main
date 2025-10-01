// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_purchase.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatestPurchaseAdapter extends TypeAdapter<LatestPurchase> {
  @override
  final int typeId = 26;

  @override
  LatestPurchase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatestPurchase(
      fields[0] as int?,
      fields[1] as int?,
      fields[2] as int?,
      fields[3] as String?,
      fields[4] as int?,
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LatestPurchase obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.packageId)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.payment)
      ..writeByte(5)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatestPurchaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestPurchase _$LatestPurchaseFromJson(Map<String, dynamic> json) =>
    LatestPurchase(
      json['id'] as int?,
      json['student_id'] as int?,
      json['package_id'] as int?,
      json['type'] as String?,
      json['payment'] as int?,
      json['price'] as String?,
    );

Map<String, dynamic> _$LatestPurchaseToJson(LatestPurchase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'package_id': instance.packageId,
      'type': instance.type,
      'payment': instance.payment,
      'price': instance.price,
    };
