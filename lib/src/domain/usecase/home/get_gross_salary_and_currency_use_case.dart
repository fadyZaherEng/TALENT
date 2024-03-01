import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_gross_salary_and_currency.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';

class GetGrossSalaryAndCurrencyUseCase {
  final HomeRepository _homeRepository;

  GetGrossSalaryAndCurrencyUseCase(this._homeRepository);

  Future<DataState<RemoteGetGrossSalaryAndCurrency>> call() async {
    return await _homeRepository.getGrossSalaryAndCurrency();
  }
}
