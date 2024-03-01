import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/repositories/get_my_team_request/get_my_team_request_repository.dart';

class GetCompaniesAndEmployeesListUseCase {
  final GetMyTeamRequestRepository _getMyTeamRequestRepository;

  GetCompaniesAndEmployeesListUseCase(this._getMyTeamRequestRepository);

  Future<DataState<CompaniesAndEmployeesList>> call({
   required int employeeId,
  }) async {
    return await _getMyTeamRequestRepository.getCompaniesAndEmployeesList(
      employeeId: employeeId,
    );
  }
}
