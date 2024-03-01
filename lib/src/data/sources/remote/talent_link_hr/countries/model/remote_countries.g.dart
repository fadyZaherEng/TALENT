// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCountries _$RemoteCountriesFromJson(Map<String, dynamic> json) =>
    RemoteCountries(
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => RemoteCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => RemoteCity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteCountriesToJson(RemoteCountries instance) =>
    <String, dynamic>{
      'countries': instance.countries,
      'cities': instance.cities,
    };
