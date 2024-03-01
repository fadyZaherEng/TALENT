// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_submenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSubmenu _$RemoteSubmenuFromJson(Map<String, dynamic> json) =>
    RemoteSubmenu(
      title: json['title'] as String?,
      id: json['id'] as int?,
      path: json['path'] as String?,
      label: json['label'] as String?,
      icon: json['icon'] as String?,
      class1: json['class1'] as String?,
      extralink: json['extralink'] as bool?,
      labelClass: json['labelClass'] as String?,
      order: json['order'] as int?,
      submenu: (json['submenu'] as List<dynamic>?)
          ?.map((e) => RemoteSubmenu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteSubmenuToJson(RemoteSubmenu instance) =>
    <String, dynamic>{
      'path': instance.path,
      'icon': instance.icon,
      'class1': instance.class1,
      'label': instance.label,
      'labelClass': instance.labelClass,
      'extralink': instance.extralink,
      'title': instance.title,
      'order': instance.order,
      'id': instance.id,
      'submenu': instance.submenu,
    };
