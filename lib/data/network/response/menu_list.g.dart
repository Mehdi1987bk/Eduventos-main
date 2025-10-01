// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuList _$MenuListFromJson(Map<String, dynamic> json) => MenuList(
      id: json['id'] as int,
      orderNumber: json['order_number'] as int,
      type: json['type'] as String,
      nameAz: json['name_az'] as String,
      slug: json['slug'] as String,
      sidebarStatus: json['sidebar_status'] as int,
      topbarStatus: json['topbar_status'] as int,
      status: json['status'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'type': instance.type,
      'name_az': instance.nameAz,
      'slug': instance.slug,
      'sidebar_status': instance.sidebarStatus,
      'topbar_status': instance.topbarStatus,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'icon': instance.icon,
    };
