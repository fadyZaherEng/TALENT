// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteNotifications _$RemoteNotificationsFromJson(Map<String, dynamic> json) =>
    RemoteNotifications(
      id: json['notificationId'] as int?,
      title: json['notificationTitle'] as String?,
      body: json['notificationBody'] as String?,
      date: json['notificationDate'] as String?,
      time: json['notificationTime'] as String?,
    );

Map<String, dynamic> _$RemoteNotificationsToJson(
        RemoteNotifications instance) =>
    <String, dynamic>{
      'notificationId': instance.id,
      'notificationTitle': instance.title,
      'notificationBody': instance.body,
      'notificationDate': instance.date,
      'notificationTime': instance.time,
    };
