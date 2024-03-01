// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_subscribe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetSubscribeInfo _$RemoteGetSubscribeInfoFromJson(
        Map<String, dynamic> json) =>
    RemoteGetSubscribeInfo(
      subscriberId: json['subscriberId'] as int?,
      subscriberName: json['subscriberName'] as String?,
      termsAndConditions: json['termsAndConditions'] as String?,
      aboutUs: json['aboutUs'] as String?,
    );

Map<String, dynamic> _$RemoteGetSubscribeInfoToJson(
        RemoteGetSubscribeInfo instance) =>
    <String, dynamic>{
      'subscriberId': instance.subscriberId,
      'subscriberName': instance.subscriberName,
      'termsAndConditions': instance.termsAndConditions,
      'aboutUs': instance.aboutUs,
    };
