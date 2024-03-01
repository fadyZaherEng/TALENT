import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/home/policies.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';

class GetPoliciesUseCase {
  final HomeRepository _homeRepository;

  GetPoliciesUseCase(this._homeRepository);

  Future<DataState<Policies>> call({required int employeeId}) async {
    return await _homeRepository.getPolicies(employeeId: employeeId);
  }
}
