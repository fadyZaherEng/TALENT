import 'package:talent_link/src/domain/entities/countries/city.dart';
import 'package:talent_link/src/domain/entities/countries/country.dart';

class Countries {
  final List<Country>? countries;
  final List<City>? cities;

  Countries({
    this.countries,
    this.cities,
  });
}
