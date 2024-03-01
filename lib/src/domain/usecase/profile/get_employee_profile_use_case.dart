import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';
import 'package:talent_link/src/domain/repositories/profile/get_profile_employee_repository.dart';

class GetEmployeeProfileUseCase {
  final GetProfileEmployeeRepository _repository;

  GetEmployeeProfileUseCase(this._repository);

  Future<DataState<ProfileEmployee>> call({
    int employeeId = 2220,
  }) async {
    return await _repository.getProfileEmployee(
      employeeId: employeeId,
    );
  }
}
