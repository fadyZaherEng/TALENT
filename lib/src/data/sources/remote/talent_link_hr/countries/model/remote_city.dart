import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/countries/city.dart';

part 'remote_city.g.dart';

@JsonSerializable()
class RemoteCity {
  @JsonKey(name: 'cityId')
  final int? cityId;
  @JsonKey(name: 'cityName')
  final String? cityName;
  @JsonKey(name: 'countryId')
  final int? countryId;

  RemoteCity({
    this.cityId,
    this.cityName,
    this.countryId,
  });

  factory RemoteCity.fromJson(Map<String, dynamic> json) =>
      _$RemoteCityFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCityToJson(this);
}

extension RemoteCityExtension on RemoteCity {
  City mapToDomain() {
    return City(countryId: countryId!, cityName: cityName!, cityId: cityId!);
  }
}

extension RemoteCityListExtension on List<RemoteCity>? {
  List<City> mapCityToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
