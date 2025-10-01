// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeOptionAdapter extends TypeAdapter<TypeOption> {
  @override
  final int typeId = 18;

  @override
  TypeOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeOption(
      id: fields[0] as int,
      name: fields[2] as String?,
      count: fields[1] as int?,
      title: fields[3] as String?,
      titleAz: fields[4] as String?,
      price: fields[5] as double?,
      subjects: (fields[8] as List?)?.cast<Subject>(),
      imageUrl: fields[6] as String?,
      images: (fields[7] as List?)?.cast<String>(),
      boolParams: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TypeOption obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.titleAz)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.subjects)
      ..writeByte(9)
      ..write(obj.boolParams);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeOption _$TypeOptionFromJson(Map<String, dynamic> json) => TypeOption(
      id: json['id'] as int,
      name: json['name'] as String?,
      count: json['count'] as int?,
      title: json['title'] as String?,
      titleAz: json['title_az'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['image_url'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      boolParams: json['bool_params'] as bool?,
    );

Map<String, dynamic> _$TypeOptionToJson(TypeOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'name': instance.name,
      'title': instance.title,
      'title_az': instance.titleAz,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'images': instance.images,
      'subjects': instance.subjects,
      'bool_params': instance.boolParams,
    };
