// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCity _$RemoteCityFromJson(Map<String, dynamic> json) => RemoteCity(
      cityId: json['cityId'] as int?,
      cityName: json['cityName'] as String?,
      countryId: json['countryId'] as int?,
    );

Map<String, dynamic> _$RemoteCityToJson(RemoteCity instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'countryId': instance.countryId,
    };
