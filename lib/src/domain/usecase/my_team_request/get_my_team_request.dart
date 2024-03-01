import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/domain/repositories/get_my_team_request/get_my_team_request_repository.dart';

class GetMyTeamRequestUseCase {
  final GetMyTeamRequestRepository _getMyTeamRequestRepository;

  GetMyTeamRequestUseCase(this._getMyTeamRequestRepository);

  Future<DataState<List<MyTeamRequest>>> call({
    required int managerEmployeeId,
    required int filterCompanyId,
    required int filerEmployeeId,
    required int requestTypeId,
    required String requestFromDate,
    required String requestToDate,
    required String createdDateAt,
    required String createdDateFrom,
    required int requestDataId,
    required int transactionStatusId,
  }) async {
    return await _getMyTeamRequestRepository.getMyTeamRequest(
      managerEmployeeId: managerEmployeeId,
      filterCompanyId: filterCompanyId,
      filerEmployeeId: filerEmployeeId,
      requestTypeId: requestTypeId,
      requestFromDate: requestFromDate,
      requestToDate: requestToDate,
      createdDateAt: createdDateAt,
      createdDateFrom: createdDateFrom,
      requestDataId: requestDataId,
      transactionStatusId: transactionStatusId,
    );
  }
}
