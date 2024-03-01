import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/countries/countries.dart';
import 'package:talent_link/src/domain/repositories/countries/countries_repository.dart';

class GetCountriesAndCitiesTypesUseCase {
  final CountriesRepository _repository;

  GetCountriesAndCitiesTypesUseCase(this._repository);

  Future<DataState<Countries>> call() async {
    return await _repository.countries();
  }
}
