import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/countries/model/remote_city.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/countries/model/remote_country.dart';
import 'package:talent_link/src/domain/entities/countries/countries.dart';

part 'remote_countries.g.dart';

@JsonSerializable()
class RemoteCountries {
  @JsonKey(name: 'countries')
  final List<RemoteCountry>? countries;
  @JsonKey(name: 'cities')
  final List<RemoteCity>? cities;

  RemoteCountries({
    this.countries,
    this.cities,
  });

  factory RemoteCountries.fromJson(Map<String, dynamic> json) =>
      _$RemoteCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCountriesToJson(this);
}

extension RemoteCountriesExtension on RemoteCountries {
  Countries mapToDomain() {
    return Countries(
      countries: countries!.mapCountryToDomain(),
      cities: cities!.mapCityToDomain(),
    );
  }
}
