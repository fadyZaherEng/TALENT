import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/countries/country.dart';

part 'remote_country.g.dart';

@JsonSerializable()
class RemoteCountry {
  @JsonKey(name: 'countryId')
  final int? countryId;
  @JsonKey(name: 'countryName')
  final String? countryName;

  RemoteCountry({
    this.countryId,
    this.countryName,
  });

  factory RemoteCountry.fromJson(Map<String, dynamic> json) =>
      _$RemoteCountryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCountryToJson(this);
}

extension RemoteCountryExtension on RemoteCountry {
  Country mapToDomain() {
    return Country(countryId: countryId!, countryName: countryName!);
  }
}

extension RemoteCountryListExtension on List<RemoteCountry>? {
  List<Country> mapCountryToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
