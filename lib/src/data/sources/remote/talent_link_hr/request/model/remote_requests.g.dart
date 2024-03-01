// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRequests _$RemoteRequestsFromJson(Map<String, dynamic> json) =>
    RemoteRequests(
      moduleId: json['moduleId'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      iconFilePath: json['iconFilePath'] as String?,
      mainModulesForms: json['mainModulesForms'],
      remoteSubmenu: (json['submenu'] as List<dynamic>?)
          ?.map((e) => RemoteSubmenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriberId: json['subscriberId'],
      extrafieldData: (json['extrafieldData'] as List<dynamic>?)
          ?.map((e) => RemoteExtraFieldData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteRequestsToJson(RemoteRequests instance) =>
    <String, dynamic>{
      'id': instance.id,
      'moduleId': instance.moduleId,
      'subscriberId': instance.subscriberId,
      'name': instance.name,
      'iconFilePath': instance.iconFilePath,
      'mainModulesForms': instance.mainModulesForms,
      'submenu': instance.remoteSubmenu,
      'extrafieldData': instance.extrafieldData,
    };
