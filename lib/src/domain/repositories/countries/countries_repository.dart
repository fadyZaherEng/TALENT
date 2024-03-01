import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/countries/countries.dart';

abstract class CountriesRepository {
  Future<DataState<Countries>> countries();
}
